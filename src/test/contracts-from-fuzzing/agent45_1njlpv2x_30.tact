struct Comb {
    a: Int as int4;
    b: Int as uint8;
    c: Int as int12;
}

contract SmallInts {
    x: Comb;

    init() {
        self.x = Comb{ a: -3, b: 255, c: 1023 };
    }
}
