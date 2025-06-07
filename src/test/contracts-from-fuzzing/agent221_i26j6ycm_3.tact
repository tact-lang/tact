struct MultipleOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract ManyOptionalsContract {
    optData: MultipleOptionals;

    init() {
        self.optData = MultipleOptionals{ foo: null, bar: true, baz: null };
    }
}