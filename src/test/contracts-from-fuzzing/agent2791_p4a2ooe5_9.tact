struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    nestOpt: Level1;

    init() {
        self.nestOpt = Level1{
            l2: Level2{
                l3: null,
            },
        };
    }
}
