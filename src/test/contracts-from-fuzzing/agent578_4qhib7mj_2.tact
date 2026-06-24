struct DeepNest {
    x: Int;
    y: Bool?;
    child: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract DeepTest {
    data: DeepNest;

    init() {
        self.data = DeepNest {
            x: 1,
            y: null,
            child: Inner { a: 5, b: false }
        };
    }
}