struct L1 {
    a: Int as uint8;
}

struct L2 {
    b: Int as int16;
    l1: L1;
}

struct L3 {
    c: Int as uint64;
    l2: L2;
}

contract TestContract {
    data: L3;

    init() {
        self.data = L3{
            c: 123,
            l2: L2{
                b: -45,
                l1: L1{
                    a: 67
                }
            }
        };
    }
}