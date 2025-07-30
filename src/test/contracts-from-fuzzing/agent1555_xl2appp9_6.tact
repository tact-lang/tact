struct Level2 {
    level2_val: Int;
}

struct Level1 {
    level1_val: Int;
    nested: Level2;
}

contract MultiField {
    f1: Int;
    f2: Level1;
    f3: Bool;

    init() {
        self.f1 = 7;
        self.f2 = Level1{ level1_val:8, nested: Level2{level2_val:9} };
        self.f3 = true;
    }
}
