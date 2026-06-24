struct Level3Optional {
    value: Int?;
}

struct Level2Optional {
    nested: Level3Optional?;
}

struct Level1Optional {
    nested: Level2Optional?;
}

contract DeepOptionals {
    val: Level1Optional?;

    init() {
        self.val = null;
    }
}
