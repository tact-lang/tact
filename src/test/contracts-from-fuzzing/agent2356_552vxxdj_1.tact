struct DeepInner {
    foo: Int;
    bar: Bool?;
}

struct DeepOuter {
    nested: DeepInner?;
    val: Int;
}

contract DeepStorage {
    s: DeepOuter;    

    init() {
        self.s = DeepOuter{ nested: null, val: 1 };
    }
}