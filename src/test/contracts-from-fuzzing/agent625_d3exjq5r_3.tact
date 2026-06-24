struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    p: Int?;
    q: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer {
            p: null,
            q: Inner{ x: 42, y: true }
        };
    }
}