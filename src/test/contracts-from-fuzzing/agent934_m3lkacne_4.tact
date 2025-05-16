struct OptionalInner {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptionalNested {
    nestedOpt: OptionalInner?;
    simple: Int;

    init() {
        self.nestedOpt = OptionalInner{
            val1: null,
            val2: true,
            val3: null,
        };
        self.simple = 123;
    }
}