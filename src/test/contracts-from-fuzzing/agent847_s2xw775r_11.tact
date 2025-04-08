struct Level3 {
    val: Int;
}

struct Level2 {
    opt: Level3?;
}

struct Level1 {
    sub: Level2;
}

contract OptionalInsideInner {
    data: Level1;

    init() {
        self.data = Level1{ sub: Level2{ opt: null } };
    }
}