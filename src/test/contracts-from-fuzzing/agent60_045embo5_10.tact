struct Packed {
    small: Int as uint8;
    medium: Int as int16;
    large: Int as uint64;
}

struct Middle {
    packedOpt: Packed?;
}

struct Outer {
    middleOpt: Middle?;
}

contract TestContract {
    nestedData: Outer = Outer{ middleOpt: null };

    init() {
        self.nestedData = Outer{ middleOpt: Middle{ packedOpt: Packed{ small:1, medium:2, large:3 } } };
    }
    receive() {}
}
