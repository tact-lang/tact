struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    nested3: Level3;
}

struct Level1 {
    x: Int;
    nested2: Level2;
}

contract DeepNestedTest {
    data: Level1 = Level1{
        x: 1,
        nested2: Level2{
            y: 2,
            nested3: Level3{ z: 3 }
        }
    };

    init() {
        self.data = Level1{
            x: 10,
            nested2: Level2{
                y: 20,
                nested3: Level3{ z: 30 }
            }
        };
    }
}
