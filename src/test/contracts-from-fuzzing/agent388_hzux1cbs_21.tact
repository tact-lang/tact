struct InnerInner {
    x: Int;
}

struct InnerStruct {
    a: Bool;
    b: InnerInner;
}

contract BothDeepAndWide {
    a: Int;
    s: InnerStruct;

    init() {
        self.a = 1;
        self.s = InnerStruct{ a:true, b:InnerInner{ x:2 } };
    }
}