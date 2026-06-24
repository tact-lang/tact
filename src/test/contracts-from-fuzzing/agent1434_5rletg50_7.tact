struct DeeplyNested1 {
    lvl2: DeeplyNested2;
}

struct DeeplyNested2 {
    lvl3: DeeplyNested3;
}

struct DeeplyNested3 {
    lvl4: Int;
}

contract NestedLevelContract {
    x: DeeplyNested1;
    init() {
        self.x = DeeplyNested1{ lvl2: DeeplyNested2{ lvl3: DeeplyNested3{ lvl4: 999 } } };
    }
}