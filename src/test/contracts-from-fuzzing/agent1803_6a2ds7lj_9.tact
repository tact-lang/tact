struct BoolString {
    flag: Bool;
    text: String;
}

contract MixedFieldsContract {
    s: BoolString;

    init() {
        self.s = BoolString {
            flag: false,
            text: "hello",
        };
    }
}