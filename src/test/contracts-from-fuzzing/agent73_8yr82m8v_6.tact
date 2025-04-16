/// Fuzz tests for Tact type system (Types, Optionals, Structs, Messages, Maps, Destructuring)

// ---------- Structs and Message Structs Definitions ----------
struct SimpleStruct { val: Int; }

// Define a simple message struct with explicit opcode
message(777) TestMsg {
    field: Int as uint8;
}

contract TypeSystemTests {

    // ---------- Primitive Types Test ----------
    fun testPrimitive() {
        let a: Int = 1 + 1;        // Expected 2
        let b: Bool = true || false; // Expected true
        let c: Cell = emptyCell();
        let d: Address = myAddress();
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }

    // ---------- Optionals Test ----------
    fun testOptionals() {
        let x: Int? = null;
        if (x == null) {
            dump(0); // Dumping 0 if x is null
        }
        x = 256;
        dump(x!!); // Should dump 256
        if (x != null) {
            dump(x);
        }
    }

    // ---------- Structs Test ----------
    fun testStruct() {
        let s: SimpleStruct = SimpleStruct{ val: 42 };
        dump(s.val);
        let cellRep: Cell = s.toCell();
        let s2: SimpleStruct = SimpleStruct.fromCell(cellRep);
        dump(s2.val);
    }

    // ---------- Message Structs Test ----------
    fun testMessage() {
        let m: Cell = TestMsg{ field: 10 }.toCell();
        dump(m);
    }

    // ---------- Maps Test ----------
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(1, 20);
        let old: Int = m.replaceGet(1, 30)!!; // should yield 20
        dump(old);
        dump(m.get(1)!!); // should dump 30 now
        let delOk: Bool = m.del(1);
        dump(delOk);
        if (m.get(1) == null) {
            dump(999);
        }
    }

    // ---------- Destructuring Test ----------
    fun testDestructuring() {
        let addr: StdAddress = parseStdAddress(myAddress().asSlice());
        let StdAddress { workchain, address } = addr;
        dump(workchain);
        dump(address);
    }

    // ---------- Combined Test Caller ----------
    fun runTests() {
        self.testPrimitive();
        self.testOptionals();
        self.testStruct();
        self.testMessage();
        self.testMap();
        self.testDestructuring();
    }

    // Default receiver to call runTests
    receive() {
        self.runTests();
        cashback(sender());
    }
}
