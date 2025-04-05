// Fuzz Testing Cycle: Type System (Valid Cases Only)
// Each contract tests a specific type or behavior as described in the official documentation.

// =======================================================
// Test 1: Valid Use of Primitive Types
contract TestPrimitives {
    fun test() {
        // Primitive types as described in the docs
        let a: Int = 1 + 2;
        let b: Bool = true;
        let c: String = "hello";
        let d: Cell = "hi".asComment();
        let e: Address = myAddress();
        dump(a);
        dump(b);
        dump(c);
        dump(d);
        dump(e);
    }
    // Dummy receive to force contract inclusion
    receive() { cashback(sender()); }
}

// =======================================================
// Test 2: Valid Use of Optionals
contract TestOptionalsValid {
    fun test() {
        // Valid optional handling: assignment and non-null assertion
        let opt: Int? = null;
        opt = 42;
        dump(opt!!); // should output 42
    }
    receive() { cashback(sender()); }
}

// =======================================================
// Test 3: Maps Operations
contract TestMaps {
    fun test() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        // Check that the value was set correctly using require
        require(m.get(1)!! == 100, "Map get failed");
        dump(m.exists(1)); // expected: true
        m.del(1);
        require(m.isEmpty(), "Map is not empty after deletion");
        dump(m.isEmpty());
    }
    receive() { cashback(sender()); }
}

// =======================================================
// Test 4: Struct Conversion and Usage
struct One { number: Int; }

contract TestStructConversion {
    fun test() {
        let o: One = One{ number: 123 };
        let cell = o.toCell();
        let o2 = One.fromCell(cell);
        if (o2.number != 123) {
            require(false, "Struct conversion failed");
        }
        dump(o2.number); // expected: 123
    }
    receive() { cashback(sender()); }
}

// =======================================================
// Test 5: Integer Division Rounding
contract TestIntDivision {
    fun test() {
        let pos: Int = 3 / 2;      // expected: 1
        let neg: Int = -3 / 2;     // expected: -2 (rounding toward -∞)
        dump(pos);
        dump(neg);
    }
    receive() { cashback(sender()); }
}

// =======================================================
// Test 6: Extension Function Usage
extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension {
    fun test() {
        let str: String = 5.toCoinsString2();
        // Expected: string representation of 5 with 9 decimal places
        dump(str);
    }
    receive() { cashback(sender()); }
}

// =======================================================
// Test 7: Function with Optional Parameter
contract TestOptionalFunction {
    fun f(opt: Int?) : Int {
        if (opt == null) {
            return 0;
        } else {
            return opt!!;
        }
    }
    fun test() {
        // Using self.f because f is a contract-level function
        let a = self.f(null);
        let b = self.f(100);
        dump(a); // expected: 0
        dump(b); // expected: 100
    }
    receive() { cashback(sender()); }
}

// =======================================================
// Test 8: Message Struct Usage
message TestMsg { val: Int as uint8; }

contract TestMessage {
    fun test() {
        let msg = TestMsg{ val: 42 };
        let cell = msg.toCell();
        dump(cell); // outputs the cell containing the message
    }
    receive() { cashback(sender()); }
}

// End of Type System Fuzz Testing Suite
