struct OptionalNested {
    foo: Int?;
    bar: Bool?;
}

contract OptionalFieldsContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{foo: null, bar: null};
    }
}