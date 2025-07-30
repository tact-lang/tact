struct One { number: Int; }

message TestMsg { val: Int as uint8; }

contract TypeSystemValidTest {

    // Test primitive types: integers and arithmetic
    fun testPrimitive() {
        let a: Int = 2 + 3;
        dump(a); // Expected output: 5
    }

    // Test optionals: correct assignment and non-null assertion
    fun testOptional() {
        let op: Int? = null;
        op = 42;
        dump(op!!); // Expected output: 42
    }

    // Test maps: proper type ascription and usage
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        dump(m.get(1)!!); // Expected output: 100
    }

    // Test structs: instantiation and field access
    fun testStruct() {
        let s: One = One{ number: 123 };
        dump(s.number); // Expected output: 123
    }

    // Test message structs: construction and conversion to Cell
    fun testMessage() {
        let msg: TestMsg = TestMsg{ val: 42 };
        dump(msg.val); // Expected output: 42
        dump(msg.toCell()); // Expected output: Cell representation of TestMsg
    }

    // Test String literal to Cell conversion
    fun testStringAndCell() {
        let s: String = "Hello Tact";
        let c: Cell = s.asComment();
        dump(c); // Expected: Cell with comment from the string
    }

    // Test cell builder usage
    fun testCellBuilder() {
        let b: Builder = beginCell()
            .storeUint(10, 5); // store value 10 using 5 bits
        let c: Cell = b.endCell();
        dump(c); // Expected: Cell containing the stored value
    }

    // A function to run all tests sequentially
    fun runAll() {
        self.testPrimitive();
        self.testOptional();
        self.testMap();
        self.testStruct();
        self.testMessage();
        self.testStringAndCell();
        self.testCellBuilder();
    }
}
