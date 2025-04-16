struct S {
    a: Int? as uint8;
    b: Int? as int32;
    c: Int? as uint64;
    d: Int? as int256;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: 12,
            b: null,
            c: 12345678,
            d: null,
        };
    }

    receive() {}
}