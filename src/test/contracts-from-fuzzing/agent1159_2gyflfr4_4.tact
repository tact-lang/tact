struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{ inner: Level2{ inner: Level3{ val: 42 } } };
    }
}