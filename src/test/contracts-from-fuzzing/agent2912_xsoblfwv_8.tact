struct ContainsString {
    s: String;
}

contract TestString {
    x: ContainsString;
    init() {
        self.x = ContainsString{ s: "Hello" };
    }
}