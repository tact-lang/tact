struct OptionalNested {
    a: Int?;
    b: Bool?;
}

contract OptNestedContract {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            a: null,
            b: true,
        };
    }
}