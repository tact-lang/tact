struct Ab {
    a: Int;
    b: Int;
}

struct Cd {
    c: Int;
    d: Int;
}

contract TestContract {
    x: Ab;
    y: Cd;

    init() {
        self.x = Ab{a: 1, b: 2};
        self.y = Cd{c: 3, d: 4};
    }

    receive() {}
}