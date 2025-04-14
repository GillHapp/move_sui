module my_module::animal {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use std::string::{Self, String};

    // 👤 Object definition
    public struct AnimeObject has key {
        id: UID,
        name: String,
        no_of_legs: u8,
        favorite_food: String,
    }

    // 🧾 Witness struct must match module name (uppercase)
   public struct ANIMAL has drop {}

    // 🛠️ Constructor (only callable once after publish)
    fun init(_witness: ANIMAL, ctx: &mut TxContext) {
        let anime = AnimeObject {
            id: object::new(ctx),
            name: string::utf8(b"Dog"),
            no_of_legs: 4,
            favorite_food: string::utf8(b"Bone"),
        };
        let sender = tx_context::sender(ctx);
        transfer::transfer(anime, sender);
    }
}
