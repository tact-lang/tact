struct OptionalNested {
    foo: Int?;
    bar: Bool?;
    name: String?;
}

contract Test {
    opts: OptionalNested;

    init() {
        self.opts = OptionalNested{foo: null, bar: true, name: null};
    }
}