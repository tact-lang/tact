struct InnerStruct {
    a: Int;
    b: Bool;
}

struct MiddleStruct {
    s1: InnerStruct;
    s2: InnerStruct?;
}

contract StructChain {
    data: MiddleStruct?;

    init() {
        self.data = null;
    }
}