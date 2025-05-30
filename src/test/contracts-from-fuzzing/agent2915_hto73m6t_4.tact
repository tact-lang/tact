struct Level2 {
    x: Int;
}

struct Level1 {
    inner: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{ inner: Level2{ x: 42 } };
    }
}
