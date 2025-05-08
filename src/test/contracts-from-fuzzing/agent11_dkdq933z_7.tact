// Test deeply nested structs with optional fields inside deeply nested struct

struct Level3 {
    a: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract TestContract {
    top: Level1?;

    init() {
        self.top = null;
    }
}