struct DeepNested {
    lvl1: Int;
    lvl2: NestedLevel2;
}

struct NestedLevel2 {
    lvl2_val: Int;
    lvl3: NestedLevel3;
}

struct NestedLevel3 {
    flagA: Bool;
    txt: String;
    maybeVal: Int?;
}

contract DeepContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            lvl1: 1,
            lvl2: NestedLevel2{
                lvl2_val: 2,
                lvl3: NestedLevel3{
                    flagA: true,
                    txt: "hello",
                    maybeVal: null
                }
            }
        };
    }
}