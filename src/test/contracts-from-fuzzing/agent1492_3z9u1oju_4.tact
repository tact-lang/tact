struct Level3 {
    flag: Bool;
}

struct Level2 {
    deep: Level3;
}

struct Level1 {
    mid: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            mid: Level2{
                deep: Level3{
                    flag: false,
                },
            },
        };
    }
}