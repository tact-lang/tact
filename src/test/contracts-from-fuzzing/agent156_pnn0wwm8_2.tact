struct NestedLevel2 {
    x: Int;
    flag: Bool;
}

struct NestedLevel1 {
    lvl2: NestedLevel2;
    flag1: Bool;
}

contract DeepNestTest {
    storage: NestedLevel1;

    init() {
        self.storage = NestedLevel1{
            lvl2: NestedLevel2{x: 10, flag: true},
            flag1: false
        };
    }
}
