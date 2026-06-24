struct DeepInner {
    z: Bool?;
}

struct Inner {
    x: Int?;
    y: DeepInner;
}

contract TestContract {
    nested: Inner;
    init() {
        self.nested = Inner{
            x: null,
            y: DeepInner { z: true }
        };
    }
}