struct OptionalComplex {
    flag: Bool?;
    text: String?;
    val: Int?;
}

contract OptFields {
    o: OptionalComplex;

    init() {
        self.o = OptionalComplex{
            flag: null,
            text: null,
            val: 123
        };
    }
}