struct L2 {
    z: Bool;
}

struct L1 {
    y: L2;
}

contract DeepNestedStruct {
    foo: L1;
    init() {
        self.foo = L1{ y: L2{ z: true } };
    }
}
