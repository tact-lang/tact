struct DeepLevel3 {
    xx: Int;
}

struct DeepLevel2 {
    lv3: DeepLevel3;
}

struct DeepLevel1 {
    lv2: DeepLevel2;
}

contract VeryDeep {
    root: DeepLevel1;

    init() {
        self.root = DeepLevel1{ lv2: DeepLevel2{ lv3: DeepLevel3{ xx: 99 } } };
    }
}