struct Level1 {
    f: Int;
}

struct Level2 {
    s: Level1?;
}

struct Level3 {
    p: Level2?;
}

contract MultiOptChain {
    top: Level3;

    init() {
        self.top = Level3{ p: Level2{ s: null } };
    }
}
