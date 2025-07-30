struct BoolOnly {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
}

contract TestBools {
    f: BoolOnly;

    init() {
        self.f = BoolOnly{
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: false,
        };
    }
}