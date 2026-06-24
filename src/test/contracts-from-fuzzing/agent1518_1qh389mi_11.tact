struct HasString {
    name: String;
    nick: String?;
}

contract StringFields {
    s: HasString;

    init() {
        self.s = HasString{
            name: "Alice",
            nick: null
        };
    }
}