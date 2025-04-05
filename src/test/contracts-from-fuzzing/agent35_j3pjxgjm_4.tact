contract TestOptionalCorrect {
    fun test() {
        // Optionals: assign null then a value, then non-null assertion
        let opt: Int? = null;
        opt = 200;
        // Expected to dump 200
        dump(opt!!);
    }
    receive() { self.test(); }
}

contract TestMap {
    fun test() {
        // Maps: create a map, set a key, get it, and check non-existing key
        let m: map<Int, Int> = emptyMap();
        m.set(1, 20);
        // Expected to dump 20
        dump(m.get(1)!!);
        // Expected to dump false since key 2 doesn't exist
        dump(m.exists(2));
    }
    receive() { self.test(); }
}

// Define a simple struct
struct One { number: Int; }

contract TestStruct {
    fun test() {
        // Struct: instantiate, convert to cell and back, then dump field
        let s: One = One { number: 33 };
        let c = s.toCell();
        let s2 = One.fromCell(c);
        // Expected to dump 33
        dump(s2.number);
    }
    receive() { self.test(); }
}

// Define a message struct
message MyMsg { someVal: Int as uint8; }

contract TestMessage {
    fun test() {
        // Message: create a message, convert to cell and back, then dump field
        let msg: MyMsg = MyMsg { someVal: 99 };
        let cell = msg.toCell();
        let msg2 = MyMsg.fromCell(cell);
        // Expected to dump 99
        dump(msg2.someVal);
    }
    receive() { self.test(); }
}

// Extension function for Int
extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

contract TestExtension {
    fun test() {
        // Extension: convert int to string with 9 decimals
        let s = 7.toCoinsString2();
        dump(s); // Expected output: 0.000000007
    }
    receive() { self.test(); }
}

contract TestPrimitive {
    fun test() {
        // Primitive types: arithmetic, strings, booleans, builder, slice, etc.

        // Arithmetic: 5 + 3 * 2 - 4 / 2 = 5 + 6 - 2 = 9
        let result = 5 + 3 * 2 - 4 / 2;
        dump(result);

        // String literal test
        let s: String = "Test string";
        dump(s);

        // Boolean expression: true && false || true -> (true && false) || true -> false || true -> true
        let b = true && false || true;
        dump(b);

        // Cell building and slice reading: storeUint and storeInt
        let bb: Builder = beginCell()
            .storeUint(3, 3)   // storing number 3 using 3 bits (max 7)
            .storeInt(-2, 4);   // storing -2 in 4 bits
        let c = bb.endCell();
        let sl: Slice = c.asSlice();
        let u = sl.loadUint(3);
        let i = sl.loadInt(4);
        dump(u);
        dump(i);
    }
    receive() { self.test(); }
}
