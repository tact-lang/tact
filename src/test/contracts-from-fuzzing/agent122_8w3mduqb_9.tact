struct SWithString {
    text: String;
    flag: Bool;
    num: Int;
}

contract HasStringField {
    s: SWithString = SWithString{
        text: "hello world",
        flag: true,
        num: 123,
    };
    init() {
        self.s = SWithString{
            text: "bye",
            flag: false,
            num: 456,
        };
    }
}
