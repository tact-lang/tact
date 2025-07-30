struct Level4 { val: Int; }
struct Level3 { inner: Level4; }
struct Level2 { inner: Level3; }
struct Level1 { inner: Level2; }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{ inner: Level2{ inner: Level3{ inner: Level4{ val: 7 }}}};
    }
}