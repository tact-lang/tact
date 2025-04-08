struct Leaf {
    v: Int = 2;
}

struct MidOpt {
    leaf: Leaf?;
    note: String = "hi";
}

struct RootOpt {
    mid: MidOpt?;
    cnt: Int = 1;
}

contract OptionDeepTree {
    root: RootOpt;

    init() {
        self.root = RootOpt{
            mid: MidOpt{
                leaf: Leaf{v: 100},
                note: "msg"
            },
            cnt: 9
        };
    }
}