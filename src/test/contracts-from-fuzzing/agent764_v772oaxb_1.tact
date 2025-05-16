struct DeepNest {
    lvl1: Int;
    nested: Inner;
}

struct Inner {
    lvl2: Int;
    deeper: Innermost;
}

struct Innermost {
    lvl3: Int;
}

contract Test {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            lvl1: 1,
            nested: Inner{
                lvl2: 2,
                deeper: Innermost{
                    lvl3: 3
                }
            }
        };
    }
}