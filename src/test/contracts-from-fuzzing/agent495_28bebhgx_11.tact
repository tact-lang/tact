struct ContainsString {
    s: String;
}

contract StringStructContract {
    data: ContainsString;

    init() {
        self.data = ContainsString{ s: "hello" };
    }
}
