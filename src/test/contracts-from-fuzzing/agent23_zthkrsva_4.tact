struct Pair { first: Int; second: Int; }

// Define a message struct to test message types
message TestMsg { value: Int as uint8; }

contract TestTypesFuzz {
    // Test primitive types: Int, Bool, String, Address, and Cell
    fun testPrimitive() {
        let a: Int = 123;
        let b = 456; // inferred Int
        dump(a + b); // Expected: 579
    }

    // Test optionals: assignment, non-null assertion, and conditional check
    fun testOptional() {
        let opt: Int? = null;
        if (opt == null) {
            opt = 999;
        }
        dump(opt!!); // Expected: 999
    }

    // Test maps: creation, insertion, retrieval
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(5, 50);
        dump(m.get(5)!!); // Expected: 50
    }

    // Test structs: instantiation, field access, cell conversion roundtrip
    fun testStruct() {
        let p: Pair = Pair{ first: 10, second: 20 };
        dump(p.first + p.second); // Expected: 30
        let cell = p.toCell();
        let p2 = Pair.fromCell(cell);
        dump(p2.first + p2.second); // Expected: 30
    }

    // Test message structs: instantiation and conversion
    fun testMessage() {
        let msg: TestMsg = TestMsg{ value: 42 };
        dump(msg.value); // Expected: 42
        dump(msg.toCell());
    }

    // Test Cells, Builders, and Slices: conversion and basic operation
    fun testCellOperator() {
        let cell: Cell = "Test".asComment();
        let slice: Slice = cell.asSlice();
        // Attempt to load the first 32 bits (if available)
        // Note: this depends on the content of the cell
        dump(slice.loadUint(32));
    }

    // Test tuple-like destructuring using a struct
    fun testPairDestructuring() {
        let p: Pair = Pair{ first: 100, second: 200 };
        let Pair { first, second } = p;
        dump(first + second); // Expected: 300
    }

    // Minimal receiver to trigger test functions
    receive() {
        self.testPrimitive();
        self.testOptional();
        self.testMap();
        self.testStruct();
        self.testMessage();
        self.testCellOperator();
        self.testPairDestructuring();
        cashback(sender());
    }
}
