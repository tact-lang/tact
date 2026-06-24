struct Level2 {
    val: Int;
}

struct Level1 {
    lvl2a: Level2;
    lvl2b: Level2;
}

contract DuplicateNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            lvl2a: Level2{val:1},
            lvl2b: Level2{val:2}
        };
    }
}