struct OptionalsAtDeepest {
    a: Int?;
}

struct Level2 {
    deep: OptionalsAtDeepest?;
}

struct Level1 {
    mid: Level2?;
}

contract NullInDeepOptionals {
    store: Level1;
    init() {
        self.store = Level1{
            mid: Level2{
                deep: null
            }
        };
    }
    receive() {}
}