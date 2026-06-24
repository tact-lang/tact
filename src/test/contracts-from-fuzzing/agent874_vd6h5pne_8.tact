struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    a: Inner;
    b: Int;
    c: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer {
            a: Inner { x: 42, y: "YYY" },
            b: 51,
            c: "ZZZ",
        };
    }
}
