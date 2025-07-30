struct MultiString {
    a: String;
    b: String;
    c: String;
}

contract ManyStrings {
    val: MultiString;
    init() {
        self.val = MultiString{ a: "A", b: "B", c: "C" };
    }
}