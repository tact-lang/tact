extends fun myExt(self: Int): String {
    return self.toString();
}

extends mutates fun increment(self: Int) {
    self += 1;
}

struct One { number: Int; }

message MyMsg { someVal: Int as uint8; }

contract TestTypes() {
    // Test primitive types: integers, booleans, and strings
    fun testPrimitives() {
        let a: Int = 1 + 1;         // expected 2
        let b: Int = 3 / 2;         // expected 1 (rounding toward -∞)
        let s: String = "hello";
        let boolVal: Bool = true && false || true; // expected true
        dump(a);
        dump(b);
        dump(s);
        dump(boolVal);
    }

    // Test optional types
    fun testOptionals() {
        let opt: Int? = null;
        opt = 42;
        let valOpt: Int = opt!!; // non-null assertion
        dump(valOpt);
    }

    // Test map types
    fun testMaps() {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        let valFromMap: Int = m.get(10)!!; // should retrieve 100
        let removed: Bool = m.del(10);    // should be true
        dump(valFromMap);
        dump(removed);
    }

    // Test struct conversion to and from Cell
    fun testStructs() {
        let one: One = One { number: 55 };
        let cellOne: Cell = one.toCell();
        let oneRecovered: One = One.fromCell(cellOne);
        dump(one.number);
        dump(oneRecovered.number);
    }

    // Test message structs conversion
    fun testMessages() {
        let msg: MyMsg = MyMsg { someVal: 255 };
        let cellMsg: Cell = msg.toCell();
        let sliceMsg: Slice = cellMsg.asSlice();
        dump(sliceMsg.bits());
    }

    // Test extension functions
    fun testExtensions() {
        dump(5.myExt()); // should print "5"
        let x = 10;
        x.increment();
        dump(x); // should print 11
    }

    // Run all tests
    fun runTests() {
        self.testPrimitives();
        self.testOptionals();
        self.testMaps();
        self.testStructs();
        self.testMessages();
        self.testExtensions();
    }

    receive() {
        self.runTests();
    }
}
