struct Level3 {
    val3: Int;
}

struct Level2 {
    opt3: Level3?;
}

struct Level1 {
    nested2: Level2;
}

contract NestOpt {
    f: Level1;
    init() {
        self.f = Level1{ nested2: Level2{ opt3: null } };
    }
}