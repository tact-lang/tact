struct NestedOptional {
    id: Int?;
    label: String;
}

contract OptionalFieldContract {
    item: NestedOptional?;

    init() {
        self.item = NestedOptional{
            id: 123,
            label: "Test"
        };
    }
}