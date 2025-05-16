struct Sizes {
    tiny: Int as uint3;   // 3 bits
    small: Int as int8;   // 8 bits signed
    normal: Int;          // default 257 bits
    wide: Int as uint256; // max size unsigned
}

struct SizesHolder {
    s: Sizes;
    flag: Bool;
}

contract SerializedInts {
    sizes: SizesHolder;

    init() {
        self.sizes = SizesHolder{
            s: Sizes{
                tiny: 5,
                small: -10,
                normal: 123456,
                wide: 12345678901234567890,
            },
            flag: true,
        };
    }

    receive() {
        let _ = self.sizes.s.normal + 1;
    }
}