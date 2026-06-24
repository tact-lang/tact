struct NestedOptionalDeep {
    level: Level1?;
}

struct Level1 {
    next: Level2?;
}

struct Level2 {
    val: Int?;
}

contract NestedOptDeepContract {
    data: NestedOptionalDeep;

    init() {
        self.data = NestedOptionalDeep{
            level: Level1{
                next: Level2{
                    val: 123
                }
            }
        };
    }
}
