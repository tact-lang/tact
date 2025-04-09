struct MixIntSer {
    a: Int as int64;
    b: Int as uint64;
    c: Int as uint8;
}

contract IntSerMixTest {
    nums: MixIntSer;

    init() {
        self.nums = MixIntSer{a: -1, b: 10, c: 255};
    }
}