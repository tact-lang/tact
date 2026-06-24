struct MixInt {
    a: Int as uint4;
    b: Int as int64;
    c: Int as int257;
}

contract IntSizeTest {
    val: MixInt;
    init() {
        self.val = MixInt{ a: 5, b: 1234567890, c: -42 };
    }
}