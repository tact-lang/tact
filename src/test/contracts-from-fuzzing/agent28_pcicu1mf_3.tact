struct OptionalNested {
    foo: Int?;
    bar: Bool?;
}

contract OptContract {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ foo: null, bar: null };
    }
}