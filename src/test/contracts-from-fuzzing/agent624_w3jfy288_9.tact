struct DeepInner {
    z: Int;
}

struct Complex {
    x: Int;
    y: Bool;
    nesting: DeepInner?;
}

contract DoubleOptionalNested {
    data: Complex?;

    init() {
        self.data = null;
    }
}