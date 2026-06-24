struct Level3 {
    x: Int;
}

struct Level2 {
    x: Int;
    inner: Level3;
}

struct Level1 {
    flag: Bool;
    nested: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            flag: false,
            nested: Level2{
                x: 8,
                inner: Level3{
                    x: 42,
                },
            },
        };
    }
}