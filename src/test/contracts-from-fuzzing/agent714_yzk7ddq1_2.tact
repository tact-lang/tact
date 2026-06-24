struct Level3 {
    z: Bool;
}

struct Level2 {
    y: Int?;
    z: Level3;
}

struct Level1 {
    x: Int;
    y: Level2;
}

contract NestedTest {
    val: Level1;

    init() {
        self.val = Level1{
            x: 42,
            y: Level2{
                y: null,
                z: Level3{ z: false }
            }
        };
    }
}