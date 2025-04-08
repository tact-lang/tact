struct OptNested {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract Test7 {
    data: OptNested;

    init() {
        self.data = OptNested{
            foo: null,
            bar: false,
            baz: null
        };
    }
}
