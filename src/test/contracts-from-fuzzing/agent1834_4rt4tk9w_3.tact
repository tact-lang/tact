struct Inner {
    x: Int?;
    y: Bool;
}

struct Outer {
    a: Inner?;
    b: Int;
    c: String?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{ x: null, y: true },
            b: 1,
            c: "hello"
        };
    }
}