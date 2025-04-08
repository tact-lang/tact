struct DeepInner {
    z: Int;
}

struct Complex {
    x: Int;
    y: Bool;
    nesting: DeepInner?;
}

contract OptionalNestedStruct {
    data: Complex;

    init() {
        self.data = Complex{
            x: 77,
            y: false,
            nesting: null,
        };
    }
}