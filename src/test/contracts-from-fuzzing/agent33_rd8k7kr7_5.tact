// This snippet tests correct usage of the Tact type system as documented.
// It covers primitive types, optionals, structs, maps, and message structs.

// Define a simple struct for testing
struct One { number: Int; }

// Define a struct with a default field for testing optionals and defaults
struct Params { 
    val: One;
    name: String = "default"; 
}

// Define a message struct for testing message conversion
message MyMsg {
    someVal: Int as uint8;
}

// The following contract aggregates multiple tests for the type system.
contract TypeSystemFuzz {

    // Test primitive types and basic operations
    fun testPrimitive() {
        // Integer arithmetic
        let a: Int = 1 + 1;         // Expected: 2
        let b: Int = 3 / 2;         // Expected: 1, since division rounds toward -∞ (as per docs)
        // Boolean operation
        let flag: Bool = true && false; // Expected: false
        // String and cell conversion
        let s: String = "hello, Tact";
        let c: Cell = s.asComment();
        
        // Builder and Slice example
        let bld: Builder = beginCell().storeInt(42, 8);
        let cell1: Cell = bld.endCell();
        let slice1: Slice = cell1.asSlice();
        let x: Int = slice1.loadUint(8); // Expected: 42

        dump(a); // 2
        dump(b); // 1
        dump(flag); // false
        dump(s);
        dump(x); // 42
    }

    // Test optional types as described in the "Optionals" section
    fun testOptional() {
        let opt: Int? = null;
        // Later, assign a value to the optional
        opt = 123;
        // Non-null assertion operator (!!) is allowed on optionals
        dump(opt!!); // Expected output: 123
    }

    // Test structs: conversion to/from cells as documented in "Structs and message structs"
    fun testStruct() {
        let one: One = One{ number: 50 };
        let params: Params = Params{ val: one };
        // Convert struct to cell and recover it
        let cellOne: Cell = one.toCell();
        let oneFrom: One = One.fromCell(cellOne);
        dump(oneFrom.number); // Expected output: 50
    }

    // Test maps: operations as shown in the "Maps" section
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let val: Int = m.get(1)!!;
        dump(val); // Expected: 100
        m.del(1);
        dump(m.exists(1)); // Expected: false
    }

    // Test message struct conversion
    fun testMessageStruct() {
        // Create a message struct instance and convert to a cell
        let msgCell: Cell = MyMsg{ someVal: 42 }.toCell();
        // Dump the resulting cell to demonstrate conversion
        dump(msgCell);
    }

    receive() {
        self.testPrimitive();
        self.testOptional();
        self.testStruct();
        self.testMap();
        self.testMessageStruct();
        cashback(sender());
    }
}
