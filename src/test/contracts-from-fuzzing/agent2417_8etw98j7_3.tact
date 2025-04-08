struct DeepNestedB {
    z: Bool;
}

struct DeepNestedA {
    y: DeepNestedB;
}

contract DeepNest {
    x: DeepNestedA;

    init() {
        self.x = DeepNestedA{ y: DeepNestedB{ z: false } };
    }
}
