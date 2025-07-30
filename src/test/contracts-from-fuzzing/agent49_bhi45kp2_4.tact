struct NestedDeep {
    lvl1: Int;
    lvl2: Nested1;
}

struct Nested1 {
    lvl3: Int;
    lvl4: Nested2;
}

struct Nested2 {
    lvl5: Int;
    lvl6: Int;
}

contract DeepNestContract {
    deep: NestedDeep;

    init() {
        self.deep = NestedDeep{
            lvl1: 1,
            lvl2: Nested1{
                lvl3: 3,
                lvl4: Nested2{
                    lvl5: 5,
                    lvl6: 6
                }
            }
        };
    }
}