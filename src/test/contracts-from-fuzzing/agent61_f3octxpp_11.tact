struct Inner {
    text: String;
    flag: Bool;
}

contract ManyStructFieldsContract {
    first: Inner;
    second: Inner;
    third: Inner;

    init() {
        self.first = Inner{ text: "one", flag: true };
        self.second = Inner{ text: "two", flag: false };
        self.third = Inner{ text: "three", flag: true };
    }
}