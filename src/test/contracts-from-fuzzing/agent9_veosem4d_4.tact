struct Level3 {
    x: Int;
    y: Int;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract VeryDeepStruct {
    state: Level1;
    init() {
        self.state = Level1{
            l2a: Level2{
                l3a: Level3{ x: 1, y: 2 },
                l3b: Level3{ x: 3, y: 4 }
            },
            l2b: Level2{
                l3a: Level3{ x: 5, y: 6 },
                l3b: Level3{ x:7, y:8 }
            }
        };
    }
}