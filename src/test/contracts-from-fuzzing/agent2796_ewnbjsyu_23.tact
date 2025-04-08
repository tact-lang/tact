struct Tiny {
    a: Int as int1;
    b: Int as uint1;
    c: Bool;
}

contract SmallBits {
    t: Tiny;

    init() {
        self.t = Tiny{
            a: 0,
            b: 0,
            c: true
        };
    }
}