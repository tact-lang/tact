// Compose nested contract variables with defaults
struct Level2 {
    x: Int = 0;
    s: String = "";
}

struct Level1 {
    l2: Level2 = Level2{};
    flag: Bool = false;
}

contract DefaultNested {
    data: Level1;
    init() {
        self.data = Level1{};
    }
}