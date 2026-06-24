struct StringsNest {
    x: String;
    y: String;
}
contract Test {
    nested: StringsNest;

    init() {
        self.nested = StringsNest{
            x: "hello",
            y: "world"
        };
    }
}