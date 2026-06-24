struct MultiOpt {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    stringOpt: String?;
}

contract MultiOptionals {
    opts: MultiOpt;
    init() {
        self.opts = MultiOpt{intOpt: null, boolOpt: true, addrOpt: null, stringOpt: "hi"};
    }
}