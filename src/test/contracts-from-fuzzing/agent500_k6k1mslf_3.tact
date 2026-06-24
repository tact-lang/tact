struct OptNested {
    foo: Int?;
    bar: Bool?;
}

contract OptionalsTest {
    nested: OptNested;

    init() {
        self.nested = OptNested{ foo: null, bar: true };
    }
}