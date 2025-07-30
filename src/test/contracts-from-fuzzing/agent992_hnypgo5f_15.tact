struct DeepOptional {
    a1: Level1?;
}

struct Level1 {
    a2: Level2?;
}

struct Level2 {
    a3: Level3?;
}

struct Level3 {
    x: Int;
}

contract TestContract {
    f: DeepOptional;
    init() {
        self.f = DeepOptional{a1:null};
    }
}
