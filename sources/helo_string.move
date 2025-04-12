/*
/// Module: helo_string
module helo_string::helo_string;
*/
// Copyright (c) 2022, Sui Foundation
// SPDX-License-Identifier: Apache-2.0

/// A basic Hello World example for Sui Move, part of the Sui Move intro course:
/// https://github.com/sui-foundation/sui-move-intro-course

#[allow(duplicate_alias)]
// #[allow(unused_variables)]

module helo_string::hello_world {


    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{TxContext, sender};

    /// An object that contains an arbitrary string
    #[allow(unused_use)]
   public struct HelloWorldObject has key, store {
        id: UID,
        /// A string contained in the object
        text: string::String
    }

    #[allow(unused_use)]
    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello World!")
        };
        transfer::public_transfer(object, sender(ctx));
    }

}

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


