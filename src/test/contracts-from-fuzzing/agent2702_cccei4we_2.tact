struct NestedLevel3 {
    x: Int = 1;
}

struct NestedLevel2 {
    lvl3: NestedLevel3;
}

struct NestedLevel1 {
    lvl2: NestedLevel2;
}

contract DeeplyNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{ lvl2: NestedLevel2{ lvl3: NestedLevel3{} } };
    }
}
