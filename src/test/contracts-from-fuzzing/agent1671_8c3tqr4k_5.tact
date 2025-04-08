struct OptionalNested {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract Test {
    st: OptionalNested;

    init() {
        self.st = OptionalNested{
            foo: null,
            bar: true,
            text: null,
        };
    }
}