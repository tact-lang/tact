struct Inner {
    x: Int = 1;
    y: String?;
}

struct Outer {
    u: Int = 42;
    v: Inner;
    w: Bool?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ v: Inner{} };
    }

    receive() {
        self.data = Outer{
            v: Inner{ x: 100, y: "nested" },
            w: true
        };
    }
}
