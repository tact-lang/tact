struct Inner {
    a: Int?; // optional Int
    b: Bool?; // optional Bool
}

contract OptionalNestedStruct {
    s: Inner;

    init() {
        self.s = Inner{ a: null, b: null };
    }

    receive() {}
}