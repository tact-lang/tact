struct Tiny {
    a: Int as uint1;
    b: Bool;
    c: Int as uint2;
}

contract Test7 {
    data: Tiny;

    init() {
        self.data = Tiny{
            a: 1,
            b: true,
            c: 2
        };
    }
}