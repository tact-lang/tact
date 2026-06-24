struct DeepInner {
    z: String?;
}

struct Mid {
    inner: DeepInner?;
}

struct Outer {
    middle: Mid?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null
        };
    }
}
