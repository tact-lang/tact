contract ChainOptionalDeep {
    field: Level1?;

    init() {
        self.field = Level1{
            next: Level2{
                next: Level3{
                    val: 88
                }
            }
        };
    }
}

struct Level1 {
    next: Level2?;
}

struct Level2 {
    next: Level3?;
}

struct Level3 {
    val: Int;
}
