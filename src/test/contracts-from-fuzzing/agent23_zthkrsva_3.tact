struct One { number: Int; }

contract TestFuzzTypes {
    // Test primitive types: Int, Bool, String, Address, Cell
    fun testPrimitive() {
        let a: Int = 42;
        let b = 1_000_000; // inferred Int
        let flag: Bool = true && false;
        let str: String = "Hello, TON";
        let addr: Address = myAddress();
        let cellValue: Cell = str.asComment();
        dump(a + b);
    }

    // Test optionals: assignment, non-null assertion
    fun testOptional() {
        let x: Int? = null;
        if (x == null) {
            x = 99;
        }
        dump(x!!);
    }

    // Test maps: creation, insertion, retrieval
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        dump(m.get(1)!!);
    }

    // Test structs and their cell conversion
    fun testStruct() {
        let o: One = One{ number: 55 };
        dump(o.number);
        let cell = o.toCell();
        let o2 = One.fromCell(cell);
        dump(o2.number);
    }

    // Minimal receiver to trigger tests
    receive() {
        self.testPrimitive();
        self.testOptional();
        self.testMap();
        self.testStruct();
        cashback(sender());
    }
}
