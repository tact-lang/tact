struct MixedSerialization {
    i1: Int as int1;
    i2: Int as int257;
    u1: Int as uint1;
    u2: Int as uint256;
}

contract MixedSerialize {
    val: MixedSerialization;

    init() {
        self.val = MixedSerialization{i1: 1, i2: -1, u1: 1, u2: 123456789};
    }
}