struct OuterOptStruct {
    nestedOpt: InnerOptStruct?;
}

struct InnerOptStruct {
    x: Int?;
}

contract NestedNullAssign {
    s: OuterOptStruct;

    init() {
        self.s = OuterOptStruct { nestedOpt: null };
    }
}