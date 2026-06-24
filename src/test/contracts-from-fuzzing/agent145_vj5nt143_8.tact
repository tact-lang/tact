struct Sizer {
    bigNum: Int as uint256;
    smallNum: Int as int8;
    tinyNum: Int as uint4;
}

contract BitSizeSerialize {
    data: Sizer;

    init() {
        self.data = Sizer{
            bigNum: 1234567890123,
            smallNum: -7,
            tinyNum: 8,
        };
    }
}
