struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract ManyFields {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
    init() {
        self.inner1 = Inner{ a: 1, b: true, s: "one" };
        self.inner2 = Inner{ a: 2, b: false, s: "two" };
        self.inner3 = Inner{ a: 3, b: true, s: "three" };
    }
}