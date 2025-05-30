struct Packed {
    a: Int as int8;
    b: Int as uint4;
    c: Int as int16;
    d: Int as uint5;
    e: Int as int32;
    f: Int as uint1;
}

contract TestContract {
    data: Packed;

    init() {
        self.data = Packed{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 1
        };
    }
}