struct OptNested {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract ManyOptionals {
    data: OptNested;

    init() {
        self.data = OptNested{ foo: null, bar: null, baz: null };
    }
}