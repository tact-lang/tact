struct DeepNest {
    x: Int;
    y: Bool;
    z: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            x: 5,
            y: false,
            z: Inner{ a: 2, b: true },
        };
    }
}