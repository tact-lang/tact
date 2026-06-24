struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
    optionalL3: Level3?;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract MultiNestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2a: Level2{ l3: Level3{ a:1 }, optionalL3:null },
            l2b: Level2{ l3: Level3{ a:2 }, optionalL3:Level3{ a:3 } },
        };
    }
}