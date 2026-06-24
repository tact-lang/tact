struct ContainingStrings {
    name: String;
    optName: String?;
}

contract StringFieldsTest {
    data: ContainingStrings;

    init() {
        self.data = ContainingStrings{
            name: "test",
            optName: null
        };
    }
}