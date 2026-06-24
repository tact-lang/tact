struct Level2 {
    z: Int;
}

struct Level1 {
    y: Int;
    deep: Level2;
}

struct Top {
    x: Int;
    nested: Level1;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            x: 1,
            nested: Level1{
                y: 2,
                deep: Level2{ z: 3 }
            },
        };
    }
}