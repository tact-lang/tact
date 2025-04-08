struct DeepOptBool {
    a: Bool?;
    b: Bool?;
}

struct WrapperOptBool {
    nested: DeepOptBool?;
}

contract OptionalNestedBools {
    w: WrapperOptBool?;

    init() {
        self.w = null;
    }
}