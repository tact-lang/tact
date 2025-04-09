struct SLevel1 {
    l2a: Int;
    l2b: Int;
}

struct SLevel0 {
    f1: Int;
    f2: SLevel1;
}

contract SubStructsLevels {
    level0: SLevel0;

    init() {
        self.level0 = SLevel0{ f1: 42, f2: SLevel1{ l2a: 1, l2b: 2 } };
    }
}