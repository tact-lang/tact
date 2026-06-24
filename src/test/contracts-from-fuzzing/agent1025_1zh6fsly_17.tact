struct Level3 {
    val: Int;
}

struct Level2 {
    child: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract DeepOpt {
    root: Level1;

    init() {
        self.root = Level1{ nested: null };
    }
}
