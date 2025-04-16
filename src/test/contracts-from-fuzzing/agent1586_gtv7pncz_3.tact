struct Inner {
    x: Int;
    y: String?;
}

struct Outer {
    one: Inner;
    two: Inner;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer {
            one: Inner { x: 1, y: "first" },
            two: Inner { x: 2, y: null },
        };
    }
}