struct InnerMost {
    x: Int;
    y: Bool;
}

struct Inner {
    im: InnerMost;
    z: String;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ im: InnerMost{ x: 1, y: true }, z: "hi" }, num: 10 };
    }
}