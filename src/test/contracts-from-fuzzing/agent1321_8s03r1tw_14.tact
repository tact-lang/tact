struct AllOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptsOnly {
    data: AllOptionals;
    init() {
        self.data = AllOptionals{ foo: null, bar: null, baz: null };
    }
}