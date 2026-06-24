struct Lengths {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint24;
    d: Int as int32;
    e: Int as int64;
}

contract VariousLengths {
    long: Lengths;

    init() {
        self.long = Lengths{
            a:1, b:2, c:3, d:4, e:5
        };
    }
}