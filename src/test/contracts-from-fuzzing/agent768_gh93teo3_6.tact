struct OptStruct {
    a: Int;
    b: String?;
}

contract OptionalField {
    s: OptStruct;

    init() {
        self.s = OptStruct {
            a: 10,
            b: null
        };
    }
}