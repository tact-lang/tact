struct NestedStr {
    s: String;
}

contract ManyStrings {
    a: String;
    b: String;
    nested: NestedStr;

    init() {
        self.a = "hello";
        self.b = "world";
        self.nested = NestedStr{ s: "inside" };
    }
}