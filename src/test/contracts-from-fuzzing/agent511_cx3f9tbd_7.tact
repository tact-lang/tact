struct Level3 {
    v: Int;
    o: Int?;
}

struct Level2 {
    a: Level3;
    b: Level3;
}

struct Level1 {
    x: Level2;
    y: Level2;
    z: Int;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: Level2{
                a: Level3{ v: 1, o: null },
                b: Level3{ v: 2, o: null }
            },
            y: Level2{
                a: Level3{ v: 3, o: null },
                b: Level3{ v: 4, o: null }
            },
            z: 5
        };
    }
}