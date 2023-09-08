# DB 設計

## users table

| Column                      | Type                | Options                   |
|-----------------------------|---------------------|---------------------------|
| email                       | string              | null: false, unique: true |
| password                    | string              | null: false               |
| password_confirmation       | string              | null: false               |
| username                    | string              | null: false               |
| created_at                  | timestamp           | null: false               |
| updated_at                  | timestamp           | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user_id                             | integer    | null: false,                   |
| image_url                           | string     | null: false                    |
| name                                | string     | null: false                    |
| description                         | text       | null: false                    |
| category                            | string     | null: false,                   |
| condition                           | string     | null: false,                   |
| shipping_fee                        | string     | null: false,                   |
| shipping_region                     | string     | null: false,                   |
| shipping_days                       | string     | null: false,                   |
| price                               | integer    | null: false,                   |
| commission                          | integer    | null: false,                   |
| profit                              | integer    | null: false,                   |
| created_at                          | timestamp  | null: false,                   |
| updated_at                          | timestamp  | null: false,                   |

### Association

- belongs_to :users
- has_one :orders

## orders table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user_id         | integer    | null: false                    |
| items_id        | integer    | null: false, foreign_key: true |
| purchase_date   | timestamp  | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping-address

## shipping-address table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| postal_code                         | string     | null: false                    |
| prefecture                          | string     | null: false                    |
| city                                | text       | null: false                    |
| street_address                      | string     | null: false,                   |
| building_name                       | string     | null: false,                   |
| phone_number                        | string     | null: false,                   |

### Association

- belongs_to :orders