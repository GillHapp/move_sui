module my_module::person_module {
    use sui::object::UID;
    use sui::tx_context::{Self, TxContext};
    use std::string::String;

    /// Person object
    public struct Person has key {
        id: UID,
        name: String,
        city: String,
        age: u64,
        date_of_birth: String,
    }

    /// Public function to create a new Person object
    public fun create_person(
        name: String,
        city: String,
        age: u64,
        date_of_birth: String,
        ctx: &mut TxContext
    ): Person {
        Person {
            id: object::new(ctx),
            name,
            city,
            age,
            date_of_birth,
        }
    }
}
