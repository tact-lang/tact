struct InnerInner {
    z: String;
}

struct Inner {
    x: Int;
    y: Bool;
    nested: InnerInner;
}

contract DeepNestedStruct {
    n: Inner;
    init() {
        self.n = Inner{
            x: 1,
            y: true,
            nested: InnerInner{z:"zzz"}
        };
    }
}