struct OptNested {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructFields {
    data: OptNested;

    init() {
        self.data = OptNested{
            foo: null,
            bar: true,
        };
    }
}