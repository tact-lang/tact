struct DeepNest {
    a: Int;
    b: Inner;
}
struct Inner {
    c: Int;
    d: Int;
}

contract DeeplyNestedStruct {
    data: DeepNest;

    init() {
        self.data = DeepNest{ a: 1, b: Inner{ c: 2, d: 3 } };
    }
}