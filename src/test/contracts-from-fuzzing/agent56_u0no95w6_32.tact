struct HasString {
    info: String;
    number: Int;
}

contract StringStructStorage {
    s: HasString;

    init() {
        self.s = HasString{
            info: "info",
            number: 7
        };
    }
}