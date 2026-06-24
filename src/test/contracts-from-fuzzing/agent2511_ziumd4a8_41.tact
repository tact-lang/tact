struct DefOptMix {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    strOpt: String? = null;
    intReq: Int = 0;
}

contract DefOptMixTest {
    data: DefOptMix;

    init() {
        self.data = DefOptMix{};
    }
}