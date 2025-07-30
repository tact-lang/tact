struct OptionalNested {
    a: Int;
    b: String?;
    c: Bool;
}

contract OptionalInStruct {
    data: OptionalNested?;
    init() {
        self.data = OptionalNested{
            a: 5,
            b: null,
            c: true,
        };
    }
}
