// This file contains multiple minimal test cases focusing on the Tact type system.

//---------------------------------------
// Test 1: Optionals
//---------------------------------------
contract TestOptional {
    fun test() {
        let opt: Int? = null;
        // Reassign a non-null value
        opt = 255;
        dump(opt!!); // Expected output: 255
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

//---------------------------------------
// Test 2: Primitive Types
//---------------------------------------
contract TestPrimitiveTypes {
    fun test() {
        // Arithmetic and literals
        let a: Int = 42;
        let b: Int = 2;
        let sum: Int = a + b; // Expected: 44
        dump(sum);

        dump(0);           // integer literal
        dump(0xFF);        // hexadecimal literal
        dump(0b1010);      // binary literal (10 in decimal)
        dump(0o77);        // octal literal (63 in decimal)
        dump(true);        // boolean literal
        dump(false);

        // Address using myAddress()
        let addr: Address = myAddress();
        dump(addr);
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

//---------------------------------------
// Test 3: Structs
//---------------------------------------
struct One { number: Int; }

contract TestStruct {
    fun test() {
        let s: One = One{ number: 50 };
        dump(s.number); // Expected output: 50
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

//---------------------------------------
// Test 4: Maps
//---------------------------------------
contract TestMap {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        dump(m.get(1)!!); // Expected output: 100
        dump(m.get(2)!!); // Expected output: 200
        m.del(1);
        dump(m.exists(1)); // Expected: false
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

//---------------------------------------
// Test 5: Composite Structures with Defaults and Nested Structs
//---------------------------------------
struct Params {
    name: String = "Satoshi"; // default value
    age: Int?;                // defaults to null
    val: One;
}

contract TestCompositeStructs {
    fun test() {
        // Using field punning to supply only the mandatory field
        let p: Params = Params{ val: One{ number: 77 } };
        dump(p.name);         // Expected: "Satoshi"
        dump(p.age);          // Expected: null (absence)
        dump(p.val.number);   // Expected: 77
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

//---------------------------------------
// Test 6: Extension Functions
//---------------------------------------
// Define extension functions for Int
extends fun toCoinsString2(self: Int): String {
    // Produce a string representation with 9 fractional digits
    return self.toFloatString(9);
}

extends mutates fun hippityHoppity(self: Int) {
    // Mutate self by incrementing
    self += 1;
}

contract TestExtensions {
    fun test() {
        let x: Int = 10;
        let s: String = x.toCoinsString2();
        dump(s); // Expected: "0.000000010" or equivalent formatted output

        // Testing extension mutation on a mutable local variable
        let y: Int = 10;
        y.hippityHoppity();
        dump(y); // Expected output: 11
    }
    receive() {
        self.test();
        cashback(sender());
    }
}

//---------------------------------------
// Test 7: Message Structs
//---------------------------------------
message TestMsg { field: Int as uint8; }

contract TestMsgReceiver {
    receive(msg: TestMsg) {
        dump(msg.field); // Output depends on the sender's message
        cashback(sender());
    }
}

//---------------------------------------
// Test 8: Invalid Type Usage
//---------------------------------------
// The following test is commented out because the documentation specifies that
// inner types of maps cannot be optional, and this should yield a compile-time error.
/*
contract TestMapOptionalInvalid {
    fun test() {
        let m: map<Int, Int?> = emptyMap(); // Should be rejected: inner value type cannot be optional
    }
    receive() {
        self.test();
        cashback(sender());
    }
}
*/
