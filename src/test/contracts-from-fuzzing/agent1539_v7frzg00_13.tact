struct Level3 {
    c: Int;
}

struct Level2 {
    b: Level3?;
}

struct Level1 {
    a: Level2?;
}

contract OptionalCascade {
    val: Level1?;
    init() {
        self.val = null;
    }
}