struct DeepNest {
    x: Int;
    y: Bool?;
    z: Inner;
}

struct Inner {
    m: Int?;
    n: Bool;
}

contract Test {
    val: DeepNest;

    init() {
        self.val = DeepNest{
            x: 1,
            y: null,
            z: Inner{m: null, n: true}
        };
    }
}
