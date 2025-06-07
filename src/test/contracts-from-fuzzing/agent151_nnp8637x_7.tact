struct Annotated {
    val1: Int as int8;
    val2: Int as uint64;
    val3: Int as coins;
}

contract Test {
    s: Annotated;

    init() {
        self.s = Annotated{
            val1: -7,
            val2: 12345678,
            val3: ton("0.5"),
        };
    }
}