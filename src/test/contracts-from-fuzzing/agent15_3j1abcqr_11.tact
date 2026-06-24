/// This file contains multiple minimal tests that exercise the type system in Tact:

// Test 1: Primitive Types
contract TestPrimitives {
    fun run() {
        let a: Int = 42;
        let b: Bool = true && false;
        let s: String = "Hello, Tact!";
        let c: Cell = beginCell().storeUint(5, 3).endCell();
        let addr: Address = myAddress();
        dump(a);
        dump(b);
        dump(s);
        dump(c);
        dump(addr);
    }
    receive() {}
}

// Test 2: Optionals
contract TestOptionals {
    fun run() {
        // Declare an optional, assign it later, then use non-null assertion
        let x: Int? = null;
        x = 100;
        dump(x!!); // Expected output: 100
    }
    receive() {}
}

// Test 3: Maps
contract TestMap {
    fun run() {
        // Valid map usage: map of Int keys to Int values
        let m: map<Int, Int> = emptyMap();
        m.set(42, 100);
        // Retrieve and dump the value at key 42 (should be 100)
        dump(m.get(42)!!);
    }
    receive() {}
}

// Test 4: Structs and Message Structs
struct One { number: Int; }

struct Params {
    name: String = "Satoshi";
    age: Int?;
    val: One;
}

message MyMsg { someVal: Int as uint8; }

contract TestStructs {
    fun run() {
        // Instantiate a simple struct and check default values
        let o: One = One{ number: 50 };
        let p: Params = Params{ val: o };
        dump(p.name); // Expected: "Satoshi"
        if (p.age == null) {
            dump("age is null");
        }
        dump(p.val.number); // Expected: 50

        // Test message struct: convert to Cell and back
        let m: MyMsg = MyMsg{ someVal: 42 };
        let mcell: Cell = m.toCell();
        dump(mcell);
        let m2: MyMsg = MyMsg.fromCell(mcell);
        dump(m2.someVal); // Expected: 42
    }
    
    receive() {}
}

// Test 5: Division rounding
contract TestDivisionRounding {
    fun run() {
        // Division rounds toward -∞ (floor division).
        let a: Int = 3 / 2;   // Expected: 1
        let b: Int = -3 / 2;  // Expected: -2
        dump(a);
        dump(b);
    }
    receive() {}
}

// Test 6: Builder and Slice conversions
contract TestBuilderSlice {
    fun run() {
        // Build a cell with a stored unsigned and signed integer
        let bb: Builder = beginCell().storeUint(42, 6)       // 42 in 6 bits
                             .storeInt(-10, 8);            // -10 in 8 bits
        let c: Cell = bb.endCell();
        let s: Slice = c.asSlice();
        let x: Int = s.loadUint(6);  // should be 42
        let y: Int = s.loadInt(8);   // should be -10
        dump(x);
        dump(y);
    }
    receive() {}
}

// Test 7: Conversions using asSlice
contract TestConversion {
    fun run() {
        let str: String = "Test Conversion";
        let ts: Slice = str.asSlice();
        dump(ts);

        let addr: Address = myAddress();
        let aslice: Slice = addr.asSlice();
        dump(aslice);
    }
    receive() {}
}

// Test 8: Extension function usage
extends fun toCoinsString2(self: Int): String {
    // Convert an Int to a float string with 9 decimal digits
    return self.toFloatString(9);
}

contract TestExtensionUsage {
    fun run() {
        let s = 15.toCoinsString2();
        dump(s); // Expected output: a string representing 15 with 9 fractional digits, e.g. "0.000000015"
    }
    receive() {}
}

// -------------------------------------------------------------------------
// The following tests are intentionally meant to fail and demonstrate
// that the compiler enforces type rules correctly. These tests are for
// fuzzing purposes and should trigger compile-time errors. They are commented out.

/*
// Test F1: Non-null assertion on a non-optional value (should fail)
contract TestInvalidNonNull {
    fun run() {
        let a: Int = 42;
        let b = a!!; // Error: non-null assertion cannot be applied because a is not optional
        dump(b);
    }
    receive() {}
}

// Test F2: Assigning null to a non-optional variable (should fail)
contract TestInvalidOptionalAssignment {
    fun run() {
        let a: Int = null; // Error: null is not assignable to type Int
        dump(a);
    }
    receive() {}
}

// Test F3: String concatenation using '+' operator (should fail)
contract TestStringConcat {
    fun run() {
        let s: String = "Hello" + "World"; // Error: operator '+' not allowed for String concatenation
        dump(s);
    }
    receive() {}
}

// Test F4: Using an optional type as a map key (should fail)
contract TestInvalidOptionalMapKey {
    fun run() {
        let m: map<Int?, Int> = emptyMap(); // Error: optional types are not allowed as map keys
        dump(m);
    }
    receive() {}
}
*/

// -------------------------------------------------------------------------
// End of tests for Tact type system fuzzing
