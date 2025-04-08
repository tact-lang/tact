struct Tiny { x: Int; }

contract OptTiny {
    t: Tiny?;

    init() {
        self.t = null;
    }

    receive() {
        self.t = Tiny{ x: 1 };
    }
}