struct OptionalNested {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructTest {
    nesting: OptionalNested;

    init() {
        self.nesting = OptionalNested{foo: null, bar: true};
    }
}