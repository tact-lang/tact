struct StringFields {
    title: String;
    subtitle: String;
    description: String;
}

contract StringFieldStorage {
    info: StringFields;

    init() {
        self.info = StringFields{
            title: "main",
            subtitle: "sub",
            description: "desc"
        };
    }
}