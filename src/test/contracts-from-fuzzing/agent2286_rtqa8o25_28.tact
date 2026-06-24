struct Duo {
    s: String;
    i: Int;
}

contract StringFirst {
    pair: Duo = Duo{ s: "x", i: 1 };

    init() {
        self.pair = Duo{ s: "y", i: 2 };
    }
}