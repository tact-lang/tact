struct StrS {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldContract {
    nested: StrS?;
    init() {
        self.nested = null;
    }
}