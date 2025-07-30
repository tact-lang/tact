struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract ThreeDeep {
    s: Level1;
    init() {
        self.s = Level1{ inner: Level2{ inner: Level3{ val: 7 } } };
    }
}