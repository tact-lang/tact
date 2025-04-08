struct InnerMost {
    flag: Bool;
}

struct InnerMid {
    opt: InnerMost?;
}

struct OuterMost {
    nest: InnerMid;
}

contract NestedOptStructs {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            nest: InnerMid{
                opt: InnerMost{
                    flag: true,
                },
            },
        };
    }
}