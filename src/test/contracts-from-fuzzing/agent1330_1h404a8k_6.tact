struct Level3 { val: Int; }
struct Level2 { inner: Level3; }
struct Level1 { nested: Level2; }

contract DeepNest {
    root: Level1;

    init() {
        self.root = Level1{ nested: Level2{ inner: Level3{ val: 99 } } };
    }

    receive() {}
}
