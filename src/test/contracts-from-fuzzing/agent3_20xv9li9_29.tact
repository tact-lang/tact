message(42) DeepMsg {
    a: Int;
    b: Bool;
}

struct Leaf {
    leafMsg: DeepMsg?;
    num: Int;
}

struct MiddleNest {
    leaf: Leaf;
    flag: Bool?;
}

struct RootNest {
    mid: MiddleNest?;
    val: Int;
}

contract ComboDeep {
    storage: RootNest;

    init() {
        self.storage = RootNest{
            mid: MiddleNest{
                leaf: Leaf{
                    leafMsg: DeepMsg{a: 1, b: false},
                    num: 77
                },
                flag: null
            },
            val: 42
        };
    }
}