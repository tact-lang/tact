struct Level3 {
    val: Int?;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    dep: Level2?;
}

contract TestContract {
    l1: Level1;

    init() {
        self.l1 = Level1{
            dep: Level2{
                nested: Level3{
                    val: null,
                },
            },
        };
    }
}
