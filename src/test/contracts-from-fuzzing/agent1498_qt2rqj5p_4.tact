struct NestedOptional {
    nested: Level1?;
}

struct Level1 {
    nested2: Level2?;
}

struct Level2 {
    nested3: Level3?;
}

struct Level3 {
    val: Int;
}

contract TestContract {
    nopt: NestedOptional;

    init() {
        self.nopt = NestedOptional{
            nested: null
        };
    }
}
