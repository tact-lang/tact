struct LevelA {
    a: Int?;
}

struct LevelB {
    b: LevelA?;
}

struct LevelC {
    c: LevelB?;
}

contract DeepOptional {
    state: LevelC;
    init() { self.state = LevelC{ c: null }; }
}