struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    p: Inner;
    q: String?;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{ p: Inner{ x: 42, y: true }, q: "hi" };
    }
}
