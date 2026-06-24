struct Inner {
    x: Int = 1;
    y: Bool? = null;
}

struct Outer {
    p: Inner;
    q: Int? = null;
    r: String = "default";
}

contract TestDeep {
    data: Outer;

    init() {
        self.data = Outer{
            p: Inner{ x: 10, y: true },
            q: 99,
            r: "set"
        };
    }
}