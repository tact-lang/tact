struct DeepInner {
    z: Int;
}

struct MidLevel {
    inner: DeepInner;
}

struct TopLevel {
    mid: MidLevel;
}

contract DeepNestedStruct {
    root: TopLevel;
    
    init() {
        self.root = TopLevel{ mid: MidLevel{ inner: DeepInner{ z: 42 } } };
    }
}