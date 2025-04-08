struct Level3 {
    tag: Int as uint4;
    payload: Slice as remaining;
}

struct Level2 {
    node: Level3?;
}

struct Level1 {
    child: Level2?;
}

contract TestContract {
    root: Level1?;

    init() {
        self.root = null;
    }
}