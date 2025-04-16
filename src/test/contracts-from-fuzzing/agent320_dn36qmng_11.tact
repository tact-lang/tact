struct DeepInner {
    d1: Int;
}

struct MiddleInner {
    m1: DeepInner;
}

struct OuterStruct {
    o1: MiddleInner;
    o2: MiddleInner;
}

contract Test {
    complex: OuterStruct;

    init() {
        self.complex = OuterStruct{
            o1: MiddleInner{ m1: DeepInner{d1:100} },
            o2: MiddleInner{ m1: DeepInner{d1:200} },
        };
    }
}