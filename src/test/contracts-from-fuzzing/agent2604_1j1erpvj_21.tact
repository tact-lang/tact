struct IntMix {
    x1: Int as int32;
    x2: Int as uint64;
    x3: Int as int257;
    x4: Int as uint8;
    x5: Int as coins;
}

contract IntMixTest {
    data: IntMix;

    init() {
        self.data = IntMix{
            x1:1, x2:2, x3:3, x4:4, x5:5
        };
    }
}