extends mutates fun hippityHoppity(self: Int) {
    self += 1;
}

struct Simple { a: Int; b: Bool; }

// Message struct defined globally
message(12345) MsgTest { val: Int as uint8; }

contract FuzzAllTypes {
    // Test non-null assertion on an optional that is null
    fun testNonNull() {
        let opt: Int? = null;
        try {
            let x = opt!!;
            dump(x);
        } catch (exitCode) {
            // Expect exit code 128 for null reference
            dump(128);
        }
    }

    // Test map operations: set, get, and iteration
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(2, 200);
        dump(m.get(1)!! + m.get(2)!!); // Expected 300
        let sum: Int = 0;
        foreach (k, v in m) {
            sum += v;
        }
        dump(sum); // Expected 300
    }

    // Test struct conversion: toCell and fromCell
    fun testStruct() {
        let s: Simple = Simple{ a: 55, b: true };
        let cell = s.toCell();
        let s2 = Simple.fromCell(cell);
        dump(s2.a); // Expected 55
        dump(s2.b); // Expected true
    }

    // Test extension mutation function for Int
    fun testExtension() {
        let x: Int = 10;
        x.hippityHoppity();
        dump(x); // Expected 11
    }

    // Test slice functions by converting a cell to a slice and checking bit count
    fun testSlice() {
        let cell: Cell = "Test Slice".asComment();
        let slice: Slice = cell.asSlice();
        dump(slice.bits()); // Prints bit-length of the slice
    }

    // Test message struct instantiation and conversion
    fun testMessage() {
        let msg: MsgTest = MsgTest{ val: 77 };
        dump(msg.val); // Expected 77
        dump(msg.toCell()); // Dumps cell representation of message
    }

    receive() {
        self.testNonNull();
        self.testMap();
        self.testStruct();
        self.testExtension();
        self.testSlice();
        self.testMessage();
        cashback(sender());
    }
}
