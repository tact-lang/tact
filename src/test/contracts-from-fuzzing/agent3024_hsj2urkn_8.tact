struct Deeply {
 a: Level1;
}

struct Level1 {
 b: Level2;
}

struct Level2 {
 c: Level3;
}

struct Level3 {
 d: Int;
}

contract VeryDeepNest {
    nested: Deeply;

    init() {
        self.nested = Deeply{ a: Level1{ b: Level2{ c: Level3{ d: 99 }}}};
    }
}
