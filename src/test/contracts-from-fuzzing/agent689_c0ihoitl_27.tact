struct ZeroSizedStuff {
    emptyStr: String = "";
    zeroInt: Int = 0;
    falseBool: Bool = false;
    nullOptInt: Int? = null;
}

contract ZeroDefaultsTest {
    state: ZeroSizedStuff;

    init() {
        self.state = ZeroSizedStuff{};
    }
}