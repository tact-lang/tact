struct DeepInner {
    val1: Int;
    val2: Bool;
}

struct NestedStruct {
    inner1: DeepInner;
    inner2: DeepInner;
    flag: Bool?
}

contract TestNestedStructStorage {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            inner1: DeepInner{ val1: 1, val2: false },
            inner2: DeepInner{ val1: 2, val2: true },
            flag: null
        };
    }
}