struct InnerStr {
    s: String;
}

contract StructWithString {
    x: InnerStr;
    init() {
        self.x = InnerStr{ s: "test" };
    }
}