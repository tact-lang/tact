struct DeepInner {
    val: Int;
}

struct DeepOuter {
    nested: DeepInner;
}

contract DeepNestContract {
    point: DeepOuter;
    
    init() {
        self.point = DeepOuter{ nested: DeepInner{ val: 42 } };
    }
}