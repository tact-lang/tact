struct Leaf {
    z: Int?;
}

struct MiddleOpt {
    leaf: Leaf?;
    note: String?;
}

struct RootWrap {
    mid: MiddleOpt?;
    flag: Bool;
}

contract NestedOptionals {
    data: RootWrap;

    init() {
        self.data = RootWrap{
            mid: null,
            flag: false
        };
    }
}