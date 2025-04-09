struct Inner {
    x: Int;
    y: String?;
}

struct Outer {
    a: Inner;
    b: Inner;
    c: Bool?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            a: Inner{ x: 1, y: "foo" },
            b: Inner{ x: 2, y: null },
            c: true,
        };
    }
}