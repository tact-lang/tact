struct DeepInner {
    z: Int;
}

struct Middle {
    inner: DeepInner;
}

contract DoubleNestedStruct {
    m: Middle = Middle{ inner: DeepInner{ z: 123 } };

    init() {
        self.m = Middle{ inner: DeepInner{ z: 321 } };
    }
}