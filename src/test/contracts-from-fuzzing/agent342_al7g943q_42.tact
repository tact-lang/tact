struct LeafInt { f: Int; }

struct MidOpt {
    left: LeafInt?;
    right: LeafInt?;
}

struct OuterOpt {
    m: MidOpt?;
}

contract OptionNestedNearRoot {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ m: null };
    }
}
