struct Lvl3 {
    a: Int = 1;
}

struct Lvl2 {
    x: Lvl3;
}

struct Lvl1 {
    y: Lvl2;
}

contract Test {
    node: Lvl1;

    init() {
        self.node = Lvl1{ y: Lvl2{ x: Lvl3{ a: 1 } } };
    }
}