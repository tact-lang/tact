struct ContainsText {
    title: String;
    description: String?;
}

contract TextFields {
    txt: ContainsText;

    init() {
        self.txt = ContainsText{
            title: "Hello",
            description: null,
        };
    }
}