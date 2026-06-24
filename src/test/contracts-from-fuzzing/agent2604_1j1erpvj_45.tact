struct SerMix {
    i8: Int as int8;
    i64: Int as int64;
    i257: Int as int257;
    u4: Int as uint4;
    u256: Int as uint256;
}

contract SerMixTest {
    val: SerMix;

    init() {
        self.val = SerMix{
            i8: 1, i64: 2, i257:3, u4:4, u256:5
        };
    }
}