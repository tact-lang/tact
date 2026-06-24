struct Level3 {
    flag: Bool;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract TestContract {
    val: Level1;

    init() {
        self.val = Level1{ nested: null };
    }
}
