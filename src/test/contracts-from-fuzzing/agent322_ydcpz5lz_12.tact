struct Struck {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int8;
    d: Int as uint8;
}

contract Test {
    val: Struck;

    init() {
        self.val = Struck{
            a: 0,
            b: 1,
            c: -3,
            d: 4,
        };
    }
}