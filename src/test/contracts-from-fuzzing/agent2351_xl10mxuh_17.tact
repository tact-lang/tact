struct SLevel3 {
    msg: String;
}

struct SLevel2 {
    level3: SLevel3;
}

struct SLevel1 {
    level2: SLevel2;
}

contract DeepHierarchy {
    root: SLevel1;

    init() {
        self.root = SLevel1{ level2: SLevel2{ level3: SLevel3{ msg: "deep" } } };
    }
}
