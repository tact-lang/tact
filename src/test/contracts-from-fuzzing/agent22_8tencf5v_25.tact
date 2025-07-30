// Deep optional composite chain, but one level NOT optional in the middle
struct Level3 {
    z: Int?;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    start: Level2?;
}

contract MidFixed {
    root: Level1;

    init() {
        self.root = Level1{
            start: null
        };
    }
}