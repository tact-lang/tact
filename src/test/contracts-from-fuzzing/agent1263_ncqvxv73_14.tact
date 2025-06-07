// test deeply nested persistent optional fields
struct Level3 {
    value: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract Test {
    root: Level1?;

    init() {
        self.root = null;
    }
}