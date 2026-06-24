struct OptionalNested {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    val: Int?;
}

contract TestContract {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            level1: null
        };
    }
}