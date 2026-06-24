struct Parameterized {
    number: Int as uint32;
    negative: Int as int64;
    flag: Bool;
    text: String;
}

contract SerializedTypes {
    saved: Parameterized;

    init() {
        self.saved = Parameterized{
            number: 12345,
            negative: -1234567890,
            flag: true,
            text: "serialize"
        };
    }
}