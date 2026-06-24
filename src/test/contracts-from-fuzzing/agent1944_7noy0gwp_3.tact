struct NestedLevel3 {
    val: Int;
}

struct NestedLevel2 {
    lvl3: NestedLevel3;
}

struct NestedLevel1 {
    lvl2: NestedLevel2;
}

contract DeepNestTest {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{lvl2: NestedLevel2{lvl3: NestedLevel3{val: 42}}};
    }
}