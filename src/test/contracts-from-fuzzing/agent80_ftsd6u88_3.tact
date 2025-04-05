struct S { f: Int; }

message DummyMsg { val: Int as uint8 }

contract TypeSystemFuzz() {

    // Test primitive types: Int, Bool, Cell, and String
    fun testPrimitive() {
        let a: Int = 42;
        let b: Bool = true;
        let c: Cell = emptyCell();
        let d: String = "Hello";
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }

    // Test optional types
    fun testOptional() {
        let a: Int? = null;
        let b: Int? = 123;
        if (a == null) {
            dump(0);
        } else {
            dump(a!!);
        }
        dump(b!!);
    }

    // Test maps: map<Int, Int>
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let v: Int = m.get(1)!!;
        dump(v);
        m.del(1);
        let exists: Bool = m.exists(1);
        dump(exists);
    }

    // Test structs using top-level struct S
    fun testStruct() {
        let s: S = S{ f: 77 };
        dump(s.f);
    }

    // Test message struct usage
    fun testMessage() {
        let msgCell: Cell = DummyMsg{ val: 200 }.toCell();
        let msg: DummyMsg = DummyMsg.fromCell(msgCell);
        dump(msg.val);
    }

    // Test expressions and type coercions
    fun testExpressions() {
        let x = 5 + 3 * 2;
        dump(x);
        let y: Int = ton("1");
        dump(y);
        let str: String = "TestString";
        dump(str.asComment());
    }

    receive() {
        self.testPrimitive();
        self.testOptional();
        self.testMap();
        self.testStruct();
        self.testMessage();
        self.testExpressions();
    }
}
