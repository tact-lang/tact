struct Level2 {
    c: Bool;
    d: Int;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{a: 5, b: Level2{c: true, d: 7}};
    }
}
