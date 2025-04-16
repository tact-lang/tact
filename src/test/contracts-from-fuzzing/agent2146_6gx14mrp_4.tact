struct DeepNested {
    lvl1: Int;
    lvl2: NestedLevel2;
}

struct NestedLevel2 {
    lvl3: NestedLevel3;
}

struct NestedLevel3 {
    value: Int;
}

contract DeepNestedContract {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            lvl1: 1,
            lvl2: NestedLevel2{
                lvl3: NestedLevel3{
                    value: 42
                }
            }
        };
    }
}