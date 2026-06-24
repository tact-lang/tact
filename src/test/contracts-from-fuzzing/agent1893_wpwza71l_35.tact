struct Level2 {
    y: Int;
}

struct Level1 {
    x: Level2;
}

contract InitChain {
    root: Level1;

    init() {
        self.root = Level1{ x: Level2{ y:99 } };
    }
}