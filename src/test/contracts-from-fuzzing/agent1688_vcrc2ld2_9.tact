struct ContainsString {
    text: String;
    num: Int;
}

contract TestContract {
    item: ContainsString;
    init() {
        self.item = ContainsString{
            text: "some text",
            num: 123
        };
    }
}