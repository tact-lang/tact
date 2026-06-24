struct OptNestedDeep {
    lvl2: Level2?;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    value: Int?;
}

contract ComplexOptional {
    nested: OptNestedDeep;

    init() {
        self.nested = OptNestedDeep{
            lvl2: Level2{
                lvl3: Level3{ value: null }
            }
        };
    }
}
