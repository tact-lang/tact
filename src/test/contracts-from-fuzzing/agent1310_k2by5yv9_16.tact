struct Level2 { z: Int = 42; }

struct Level1 {
    y: Int = 7;
    sub: Level2;
}

contract TestContract {
    x: Level1;

    init() {
        self.x = Level1{
            y: 100,
            sub: Level2{ z: 999 }
        };
    }
}
