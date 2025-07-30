struct DeepInner {
    flag: Bool;
}

struct Middle {
    inner: DeepInner;
}

struct Outer {
    middle: Middle;
}

contract DeepNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{middle: Middle{inner: DeepInner{flag: false}}};
    }
}