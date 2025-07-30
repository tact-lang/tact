struct Level3 {
    z: Bool;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract TestContract {
    deepOpt: Level1?;

    init() {
        self.deepOpt = null;
    }
}