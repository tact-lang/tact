struct HugeNested {
    f1: Int;
    sub: HugeNestedSub;
}

struct HugeNestedSub {
    f2: Int;
    sub2: HugeNestedSub2;
}

struct HugeNestedSub2 {
    f3: Int;
    leaf: HugeNestedLeaf;
}

struct HugeNestedLeaf {
    f4: Int;
}

contract Test {
    s: HugeNested;

    init() {
        self.s = HugeNested{
            f1:1,
            sub: HugeNestedSub{
                f2:2,
                sub2: HugeNestedSub2{
                    f3:3,
                    leaf: HugeNestedLeaf{f4:4}
                }
            }
        };
    }
}