// Test many deeply nested options, without maps
struct Level4 {
    field: Int?;
}

struct Level3 {
    l4: Level4?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract DeepOptionalsTest {
    root: Level1?;

    init() {
        self.root = null;
    }

    receive() {}
}