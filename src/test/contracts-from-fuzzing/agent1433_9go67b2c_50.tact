struct InnerWithString {
    s: String;
}

contract StructInnerString {
    f: InnerWithString;

    init() {
        self.f = InnerWithString{ s: "hello" };
    }
}
