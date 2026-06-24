struct DeepInner {
    leaf: Bool?;
}

struct Inner {
    levelTwo: DeepInner?;
}

struct Outer {
    levelOne: Inner?;
}

contract DeepOptionalNesting {
    nested: Outer;
    init() {
        self.nested = Outer{levelOne: Inner{levelTwo: DeepInner{leaf: false}}};
    }
}