struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructContract {
    data: Inner;

    init() {
        self.data = Inner{ a: 5, b: true, c: "abc" };
    }
}