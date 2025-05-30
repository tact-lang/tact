struct Level3 {
    z: Int;
    flag: Bool;
}

struct Level2 {
    y: Int;
    inner: Level3;
}

struct Level1 {
    x: Int;
    nested: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            x: 1,
            nested: Level2{
                y: 2,
                inner: Level3{
                    z: 3,
                    flag: true,
                },
            },
        };
    }
}