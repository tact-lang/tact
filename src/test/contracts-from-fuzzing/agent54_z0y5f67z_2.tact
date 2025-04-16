contract TypeFuzzTester {
    // Test primitive types: Int arithmetic and literal bases
    fun testPrimitive() {
        let a: Int = 42 + 58;
        require(a == 100, "Primitive arithmetic failed");

        // Test different literal representations
        let dec: Int = 42;
        let hex: Int = 0x2A;
        let oct: Int = 0o52;
        let bin: Int = 0b101010;
        require(dec == hex && dec == oct && dec == bin, "Literal conversion error");
    }

    // Test optionals: assignment and non-null assertion
    fun testOptional() {
        let opt: Int? = null;
        opt = 7;
        require(opt!! == 7, "Optional non-null assertion failed");
    }

    // Test struct (de)serialization
    fun testStruct() {
        let s: One = One{ number: 123 };
        let cell: Cell = s.toCell();
        let s2: One = One.fromCell(cell);
        require(s2.number == 123, "Struct (de)serialization failed");
    }

    // Test maps: insertion and retrieval
    fun testMap() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        require(m.get(1)!! == 100, "Map value retrieval failed");
    }

    // Test message struct (de)serialization
    fun testMessage() {
        let msg: MyMsg = MyMsg{ someVal: 42 };
        let cell: Cell = msg.toCell();
        let msg2: MyMsg = MyMsg.fromCell(cell);
        require(msg2.someVal == 42, "Message struct (de)serialization failed");
    }

    // The main receiver calls each test in sequence
    receive() {
        self.testPrimitive();
        self.testOptional();
        self.testStruct();
        self.testMap();
        self.testMessage();
        // If all tests pass, cashback the remaining value
        cashback(sender());
    }
}

// A simple struct to test composite types
struct One { number: Int; }

// A message struct to test message serialization. Its opcode (999) is arbitrary.
message(999) MyMsg {
    someVal: Int as uint8;
}
