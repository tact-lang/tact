struct OptNested {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructFields {
    s: OptNested;

    init() {
        self.s = OptNested{foo: null, bar: true};
    }
}
