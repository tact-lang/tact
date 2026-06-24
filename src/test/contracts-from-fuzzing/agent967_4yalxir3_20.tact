struct Tiny {
    a: Int as int1;
    b: Int as uint1;
}

contract SmallestFields {
    s: Tiny;

    init() {
        self.s = Tiny{
            a: 0,
            b: 1
        };
    }
}