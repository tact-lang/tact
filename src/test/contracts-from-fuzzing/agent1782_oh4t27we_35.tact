struct SDef {
    foo: Int as uint8 = 255;
    bar: Int as int8 = -128;
}

contract StructDefaultsSer {
    s: SDef;

    init() {
        self.s = SDef{};
    }
}