struct DeepNest {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            a: 5,
            b: Inner{ x: 7, y: null }
        };
    }
}