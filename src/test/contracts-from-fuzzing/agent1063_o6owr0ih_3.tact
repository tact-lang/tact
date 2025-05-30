struct Level3 { z: Int; }

struct Level2 { y: Bool; nested3: Level3; }

struct Level1 { x: Int; nested2: Level2; }

contract VeryDeepContract {
    deepField: Level1;

    init() {
        self.deepField = Level1{
            x: 5,
            nested2: Level2{
                y: true,
                nested3: Level3{ z: 42 }
            }
        };
    }
}