struct Packed {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
    d: Int as uint4;
}

contract BitContract {
    storage: Packed;

    init() {
        self.storage = Packed{
            a: 1, b: 2, c: 3, d: 4
        };
    }
}