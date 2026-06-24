struct StringFields {
    name: String;
    nick: String?;
    bio: String;
    comment: String?;
}

contract TextStorage {
    data: StringFields;

    init() {
        self.data = StringFields{
            name: "A",
            nick: null,
            bio: "B",
            comment: null
        };
    }
}