struct Level2 { val: Int?; }

struct Level1 { inner: Level2; }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{ inner: Level2{ val: null } };
    }
}