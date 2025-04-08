struct SLevel1 {
    s2a: SLevel2;
    s2b: SLevel2;
}

struct SLevel2 {
    s3: SLevel3;
}

struct SLevel3 {
    val: Int;
}

contract BranchTree {
    root: SLevel1;

    init() {
        self.root = SLevel1{
            s2a: SLevel2{ s3: SLevel3{ val:1 } },
            s2b: SLevel2{ s3: SLevel3{ val:2 } }
        };
    }
}