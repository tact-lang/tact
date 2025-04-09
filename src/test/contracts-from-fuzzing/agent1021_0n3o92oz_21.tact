struct Level1 {
    inner: Int;
}
struct Level2 {
    nested: Level1;
}
struct Level3 {
    nested: Level2;
}
struct Level4 {
    nested: Level3;
}

contract NestedLevels {
    val: Level4;

    init() {
        self.val = Level4{ nested: Level3{ nested: Level2{ nested: Level1{ inner: 9 } } } };
    }
}