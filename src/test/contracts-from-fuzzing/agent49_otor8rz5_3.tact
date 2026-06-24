struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TestContract {
    st: Level1;

    init() {
        self.st = Level1{
            nested: Level2{
                nested: Level3{
                    val: null,
                },
            },
        };
    }
}
