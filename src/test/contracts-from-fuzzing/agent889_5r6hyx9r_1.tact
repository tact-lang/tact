struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestNestedStruct {
    data: Inner;

    init() {
        self.data = Inner{ a: 1, b: true, c: "hi" };
    }
}