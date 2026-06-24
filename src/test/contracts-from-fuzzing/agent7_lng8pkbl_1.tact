struct NestedInner {
    b1: Bool;
    nint: Int?;
}

struct NestedOuter {
    inn: NestedInner;
    onum: Int?;
}

contract DeepContract {
    nested: NestedOuter;

    init() {
        self.nested = NestedOuter{
            inn: NestedInner{b1: true, nint: null},
            onum: 42
        };
    }
}