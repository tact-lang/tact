struct NestedNestLevel3 {
    val3: Int?; 
}

struct NestedNestLevel2 {
    lvl3: NestedNestLevel3;
    val2: String;
}

struct NestedNestLevel1 {
    lvl2: NestedNestLevel2;
    val1: Bool;
}

contract MultilevelDeepNest {
    deep: NestedNestLevel1;

    init() {
        self.deep = NestedNestLevel1{
            lvl2: NestedNestLevel2{
                lvl3: NestedNestLevel3{
                    val3: null
                },
                val2: "hello"
            },
            val1: true
        };
    }
}