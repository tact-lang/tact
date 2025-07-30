// Test 1: Primitive Integer and Arithmetic (Integer division rounding)
contract TestInt() {
    fun test() {
        // 3/2 should round toward -∞, which gives 1 according to documentation
        let a: Int = 3 / 2; // expected 1
        dump(a);
    }
    receive() { self.test(); }
}

// Test 2: Optionals
contract TestOptional() {
    fun test() {
        // Declare an optional Int and check null behavior
        let opt: Int? = null;
        if (opt == null) {
            dump(0); // dump 0 if null
        } else {
            dump(100);
        }
        // Now assign a non-null value and use non-null assertion
        let opt2: Int? = 42;
        dump(opt2!!); // should dump 42
    }
    receive() { self.test(); }
}

// Test 3: Maps
contract TestMap() {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        // Override and then check retrieval
        m.set(1, 200);
        let v: Int = m.get(1)!!;
        dump(v); // expected 200

        // Deletion test
        let deleted = m.del(1);
        dump(deleted); // expected true
        let exists = m.exists(1);
        dump(exists); // expected false
    }
    receive() { self.test(); }
}

// Test 4: Structs: Conversion to/from cell
struct One { number: Int; }
contract TestStruct() {
    fun test() {
        let s: One = One{ number: 100 };
        let cell: Cell = s.toCell();
        let s2: One = One.fromCell(cell);
        dump(s2.number); // expected 100
    }
    receive() { self.test(); }
}

// Test 5: Message Structs: Conversion to/from cell
message MyMsg { value: Int as uint8; }
contract TestMsg() {
    fun test() {
        let msg: MyMsg = MyMsg{ value: 42 };
        let cell: Cell = msg.toCell();
        let msg2: MyMsg = MyMsg.fromCell(cell);
        dump(msg2.value); // expected 42
    }
    receive() { self.test(); }
}

// Test 6: Cells, Builders, and Slices
contract TestCell() {
    fun test() {
        let cell: Cell = beginCell()
            .storeUint(42, 8)  // store the number 42 in 8 bits
            .endCell();
        let slice: Slice = cell.asSlice();
        let v: Int = slice.loadUint(8);
        dump(v); // expected 42
    }
    receive() { self.test(); }
}

// Test 7: Strings and Conversion to Cells
contract TestString() {
    fun test() {
        let s: String = "Hello, 👻";
        // Convert the string to a comment cell which prefixes it with 32 zero bits
        let commentCell: Cell = s.asComment();
        // We simply dump the cell; inspection in TVM logs or debugger confirms correct serialization.
        dump(commentCell);
    }
    receive() { self.test(); }
}

// Test 8: Invalid Type Usage (should fail at compile time)
// This test deliberately assigns a null value to a non-optional, which is disallowed by docs
// Uncommenting the following contract should produce a compile error.
/*
contract TestInvalid() {
    fun test() {
        let x: Int = null; // invalid, non-optional cannot be null
    }
    receive() { self.test(); }
}
*/

// The above tests cover primitive types, optionals, maps, structs, message structs,
// cells/builders/slices, and string conversions. 
// According to the "Primitive types", "Optionals", "Maps", and "Structs and message structs" sections
// from the Tact documentation (see /book/types#primitive-types, /book/optionals, /book/maps, and /book/structs-and-messages),
// the behavior produced here should match the documented expectations. 
// If any of these tests fails to compile or produces unexpected results, that would indicate a mismatch between
// the documentation and the compiler's actual behavior.
