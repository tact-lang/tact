struct HasBoolIntStr {
    flag: Bool;
    number: Int;
    message: String;
}

contract MixTypes {
    data: HasBoolIntStr;

    init() {
        self.data = HasBoolIntStr{
            flag: true,
            number: 42,
            message: "abc"
        };
    }
}