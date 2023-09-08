# DB 設計

## users table

| Column                      | Type                | Options                   |
|-----------------------------|---------------------|---------------------------|
| nickname                    | string              | null: false,              |
| email                       | string              | null: false, unique: true |
| encrypted_password          | string              | null: false               |
| full_name                   | string              | null: false               |
| kana_name                   | string              | null: false,              |
| birthday                    | date                | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user                                | integer    | null: false,                   |
| name                                | string     | null: false                    |
| description                         | text       | null: false                    |
| category_id                         | integer    | null: false,                   |
| condition_id                        | integer    | null: false,                   |
| shipping_fee_id                     | integer    | null: false,                   |
| shipping_region_id                  | integer    | null: false,                   |
| shipping_day_id                     | integer    | null: false,                   |
| price                               | integer    | null: false,                   |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user            | integer    | null: false, foreign_key: true |
| item            | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| postal_code                         | string     | null: false                    |
| shipping_region_id                  | string     | null: false                    |
| order                               | integer    | null: false, foreign_key: true |
| city                                | string     | null: false                    |
| street_address                      | string     | null: false,                   |
| building_name                       | string     |                                |
| phone_number                        | string     | null: false,                   |

### Association

- belongs_to :order
