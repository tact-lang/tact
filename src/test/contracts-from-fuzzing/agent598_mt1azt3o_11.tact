struct MixedSerial {
    tiny: Int as uint4;
    mid: Int as uint32;
    big: Int as int64;
    coinsVal: Int as coins;
    maybeNum: Int?;
    isFlag: Bool;
    maybeStr: String?;
}

contract HeteroNest {
    data: MixedSerial;

    init() {
        self.data = MixedSerial{
            tiny: 5,
            mid: 123456,
            big: -789876,
            coinsVal: ton("2"),
            maybeNum: null,
            isFlag: true,
            maybeStr: "hello"
        };
    }
}