struct A {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Int?;
    val5: Bool?;
    val6: String?;
    val7: Int as uint32;
    val8: Int as int64;
    val9: Bool;
    val10: String;
}

contract LongFields {
    data: A;

    init() {
        self.data = A{
            val1: 1,
            val2: true,
            val3: "test",
            val4: null,
            val5: false,
            val6: null,
            val7: 123,
            val8: -1234567890,
            val9: false,
            val10: "end"
        };
    }
}
