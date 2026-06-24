struct OptionalInside {
    field1: Int;
    opt1: String?;
    opt2: Bool?;
}

contract OptionalComplex {
    value: OptionalInside;

    init() {
        self.value = OptionalInside{
            field1: 7,
            opt1: null,
            opt2: false
        };
    }
}