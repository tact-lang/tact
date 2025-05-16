struct SerHint {
    smallInt: Int as uint4;
    smallSigned: Int as int5;
    bigNum: Int as uint64;
    flag: Bool;
}

contract TestContract {
    data: SerHint;

    init() {
        self.data = SerHint{
            smallInt: 7,
            smallSigned: -7,
            bigNum: 12345678,
            flag: true,
        };
    }

    receive() {
        let s = self.data.smallInt + self.data.smallSigned + self.data.bigNum + (self.data.flag ? 1 : 0);
    }
}