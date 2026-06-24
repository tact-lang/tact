// Testing optional struct within optional struct
struct LevelB {
    valB: Int;
}

struct LevelA {
    b: LevelB?;
}

contract OptInOpt {
    optA: LevelA?;

    init() {
        self.optA = null;
    }
}
