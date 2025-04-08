struct Level2 {
    q: Int;
}

struct Level1 {
    p: Level2;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{ p: Level2{ q: 5 } };
    }
}