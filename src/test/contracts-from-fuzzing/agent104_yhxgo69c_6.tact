struct NestedManyLevels {
    lvl1: Nested2;
}

struct Nested2 {
    lvl2: Nested3;
}

struct Nested3 {
    lvl3: Nested4;
}

struct Nested4 {
    lvl4: Nested5;
}

struct Nested5 {
    value: Int;
}

contract TestContract {
    data: NestedManyLevels;
    init() {
        self.data = NestedManyLevels{
            lvl1: Nested2{
                lvl2: Nested3{
                    lvl3: Nested4{
                        lvl4: Nested5{ value: 42 }
                    }
                }
            }
        };
    }
}