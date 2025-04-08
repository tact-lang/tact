struct X {
    i: Int as int4;
    j: Int as uint4;
    k: Int as int64;
    l: Int as uint64;
}

contract TestContract {
    data: X;
    init() {
        self.data = X{
            i: -8,
            j: 15,
            k: -12345678,
            l: 12345678
        };
    }
}