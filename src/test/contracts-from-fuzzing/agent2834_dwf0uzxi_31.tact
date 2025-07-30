struct LevelOne {
    x: Int?;
}

struct LevelTwo {
    l1: LevelOne?;
}

struct LevelThree {
    l2: LevelTwo?;
}

contract DeepOptionals {
    root: LevelThree?;

    init() {
        self.root = null;
    }
}