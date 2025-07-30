struct Level3 { val: Int; }
struct Level2 { l3a: Level3; l3b: Level3; }
struct Level1 { l2a: Level2; l2b: Level2; }

contract ComplexNested {
    data: Level1;

    init() {
        self.data = Level1{
            l2a: Level2{ l3a: Level3{ val: 1 }, l3b: Level3{ val: 2 } },
            l2b: Level2{ l3a: Level3{ val: 3 }, l3b: Level3{ val: 4 } }
        };
    }
}