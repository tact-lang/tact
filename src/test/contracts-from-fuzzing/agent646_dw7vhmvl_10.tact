struct StringFields {
    name: String;
    description: String;
    extra: String?;
}

contract StructStringTest {
    data: StringFields;

    init() {
        self.data = StringFields{
            name: "Name",
            description: "Description",
            extra: null
        };
    }
}