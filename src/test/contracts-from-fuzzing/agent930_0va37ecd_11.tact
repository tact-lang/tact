struct BoolIntString {
    flag: Bool;
    number: Int;
    text: String;
}

contract MixedFields {
    tuple: BoolIntString;

    init() {
        self.tuple = BoolIntString{
            flag: false,
            number: 123,
            text: "abc",
        };
    }
}
