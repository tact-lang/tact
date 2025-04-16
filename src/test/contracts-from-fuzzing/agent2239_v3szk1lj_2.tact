struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract VeryDeep {
    field: Level1;
    
    init() {
        self.field = Level1{ nested: Level2{ nested: Level3{ value: 42 } } };
    }
}