// optional struct field with a default value
struct Level {
    x: Int;
}

struct Top {
    nested: Level? = null;
    y: Int = 5;
}

contract TestContract {
    s: Top;

    init() {
        self.s = Top{};
    }
}