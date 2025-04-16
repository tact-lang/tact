struct MixOpt {
    txt: String? = null;
    flag: Bool? = null;
}

contract OptPrims {
    val: MixOpt;

    init() {
        self.val = MixOpt{txt: null, flag: null};
    }
}