struct NestedManyLevels1 {
    level: Int;
}

struct NestedManyLevels2 {
    lvl1: NestedManyLevels1;
    lvlOpt: NestedManyLevels1?;
}

struct NestedManyLevels3 {
    lvl2: NestedManyLevels2;
    flag: Bool;
}

contract TestContract {
    nest: NestedManyLevels3;

    init() {
        self.nest = NestedManyLevels3{
            lvl2: NestedManyLevels2{
                lvl1: NestedManyLevels1{ level: 5 },
                lvlOpt: null
            },
            flag: true
        };
    }
}
