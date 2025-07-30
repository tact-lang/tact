struct Level3 {
    f: Int;
}

struct Level2 {
    f: Level3;
}

struct Level1 {
    f: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{ f: Level2{ f: Level3{ f: 42 } } };
    }
}