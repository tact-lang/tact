struct HasBoolAndString {
    flag: Bool;
    text: String;
}

contract BoolStringHolder {
    pair: HasBoolAndString;

    init() {
        self.pair = HasBoolAndString{
            flag: true,
            text: "hello"
        };
    }
}