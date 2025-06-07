struct NestedLevel3 {
    flag: Bool;
}

struct NestedLevel2 {
    val3: Int?;
    lvl3: NestedLevel3;
}

struct NestedLevel1 {
    val1: Int;
    lvl2: NestedLevel2;
}

contract DeepStorage {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            val1: 0,
            lvl2: NestedLevel2{
                val3: null,
                lvl3: NestedLevel3{flag: false},
            },
        };
    }
}