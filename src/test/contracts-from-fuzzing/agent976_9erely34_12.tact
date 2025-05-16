struct InnerMost {
    x: Int;
    y: Int = 7;
}

struct Outer {
    inner: InnerMost;
}

contract DeepPartialInit {
    data: Outer;
    init() {
        self.data = Outer{ inner: InnerMost{ x: 3 } };
    }
}