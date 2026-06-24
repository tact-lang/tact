struct Tiny {
    x: Int as int1;
    y: Int as uint1;
}

contract TestContract {
    t: Tiny;

    init() {
        self.t = Tiny{ x: 1, y: 1 };
    }

    receive() {
        self.t = self.t;
    }
}
