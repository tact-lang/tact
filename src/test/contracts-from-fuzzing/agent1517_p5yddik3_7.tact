struct Sizes {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint1;
}

contract Test {
    sizes: Sizes;

    init() {
        self.sizes = Sizes{
            a: -42,
            b: 1234,
            c: -7,
            d: 1
        };
    }

    receive() {}
}