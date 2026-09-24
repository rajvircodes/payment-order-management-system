CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price NUMERIC(12,2) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW

    CONSTRAINT products_price_non_negative
        CHECK(price >= 0)
);

CREATE TABLE inventory(
    product_id BIGINT PRIMARY KEY,
    available_quantity INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT inventory_product_fk
        FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE,

    CONSTRAINT inventory_quantity_non_negative
        CHECK(available_quantity >= 0)
);


CREATE TABLE carts(
    id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL UNIQUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

    CONSTRAINT carts_user_fk
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
)