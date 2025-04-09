struct ZeroOne {
    zero: Int as uint1;
    one: Int as int1;
    b: Bool;
}

contract Test {
    z: ZeroOne;

    init() {
        self.z = ZeroOne{ zero: 1, one: 0, b: false };
    }
}