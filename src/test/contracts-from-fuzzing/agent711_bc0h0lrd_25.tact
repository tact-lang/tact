struct VaryingSizes {
    tiny: Int as uint1;
    small: Int as uint8;
    medium: Int as int64;
    big: Int;
}

contract SerializedSizes {
    data: VaryingSizes;

    init() {
        self.data = VaryingSizes{
            tiny:1,
            small:42,
            medium:123456789,
            big:999999999999
        };
    }
}
