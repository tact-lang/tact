struct ContainsString {
    text: String;
    flag: Bool;
}

contract StringField {
    s: ContainsString;
    init() {
        self.s = ContainsString{
            text: "Hello", flag: true
        };
    }
}