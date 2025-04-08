struct Level3 {
    foo: Int;
}

struct Level2 {
    lev3a: Level3;
    lev3b: Level3;
}

struct Level1 {
    lev2: Level2;
}

contract Deep {
    nested: Level1;
    init() {
        self.nested = Level1{
            lev2: Level2{
                lev3a: Level3{ foo: 42 },
                lev3b: Level3{ foo: 43 }
            }
        };
    }
    receive() {}
}