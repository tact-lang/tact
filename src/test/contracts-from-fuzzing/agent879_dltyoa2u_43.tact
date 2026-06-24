struct Level2 {
    a: Int;
    b: Bool;
}

struct Level1 {
    nested: Level2;
}

contract SimpleNested {
    n: Level1;
    init() {
        self.n = Level1{ nested: Level2{ a:1, b:true } };
    }
}
