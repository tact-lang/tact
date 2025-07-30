struct OptionalNested {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            field1: null,
            field2: true,
            field3: "world"
        };
    }
}