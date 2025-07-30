struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{ a: 10, b: false, c: "zzz" };
    }
}