struct Level3 {
    m: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract ManyNestedOptions {
    f1: Level1?;
    f2: Level2?;
    f3: Level3?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
    }
}
