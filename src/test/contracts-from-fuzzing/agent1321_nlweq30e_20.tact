// deeply nested optional in persistent state
struct InnerMost {
    n: Int;
}

struct Level2 {
    lvl: InnerMost?;
}

struct Level1 {
    up: Level2?;
}

contract OptionalDeep {
    d: Level1?;

    init() {
        self.d = Level1{ up: Level2{ lvl: InnerMost{ n:5 } } };
    }
}
