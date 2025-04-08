struct HasString {
    name: String;
    note: String?;
}

contract Test {
    s: HasString;

    init() {
        self.s = HasString{
            name: "note",
            note: null
        };
    }
}