struct NestedStruct {
    s1: Int;
    s2: Inner;
}

struct Inner {
    flag: Bool;
    s3: DeepInner;
}

struct DeepInner {
    x: Int;
    y: Bool;
}

contract Composite {
    field: NestedStruct;
    init() {
        self.field = NestedStruct {
            s1: 7,
            s2: Inner {
                flag: false,
                s3: DeepInner { x: 8, y: true }
            }
        };
    }
}