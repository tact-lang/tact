struct ZeroAndEmpty {
    zeroNum: Int = 0;
    emptyStr: String = "";
}

contract ZeroEmptyTest {
    d: ZeroAndEmpty;

    init() {
        self.d = ZeroAndEmpty{};
    }
}