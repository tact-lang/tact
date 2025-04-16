struct DeepNested {
    inner1: Inner;
    inner2: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner1: Inner{ a: 42, b: false },
            inner2: Inner{ a: -7, b: true }
        };
    }
}