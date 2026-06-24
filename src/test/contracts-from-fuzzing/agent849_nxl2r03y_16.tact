struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
    flag: Bool;
}

struct Level1 {
    x: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            x: Level2{
                y: Level3{ z: 123 },
                flag: true
            }
        };
    }
}