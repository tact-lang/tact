struct Level1 {
    a: Int;
}

struct Level2 {
    b: Int;
    nested: Level1;
}

struct Level3 {
    c: Int;
    nested2: Level2;
}

contract MultiChain {
    deep: Level3;

    init() {
        self.deep = Level3{
            c: 7,
            nested2: Level2{
                b: 5,
                nested: Level1{ a: 3 }
            }
        };
    }
}
