struct ContainsString {
    text: String;
    opt: String?;
}

contract TestStr {
    data: ContainsString;

    init() {
        self.data = ContainsString{
            text: "Hello",
            opt: null
        };
    }
}