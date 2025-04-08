struct OptionalNested {
    foo: Int?;
    bar: Int;
}

contract Test {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{foo: null, bar: 5};
    }
}