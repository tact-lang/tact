struct Level3 {
    q: Int?;
    r: Bool?;
}

struct Level2 {
    x: Level3?;
    y: String?;
}

struct Level1 {
    a: Level2?;
    b: Address?;
}

contract Test {
    field: Level1;

    init() {
        // All optional fields remain unset, defaulting to null implicitly
        self.field = Level1{};
    }
}