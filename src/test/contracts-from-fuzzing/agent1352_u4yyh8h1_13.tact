struct Optionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
}

contract TestContract {
    opts: Optionals;

    init() {
        self.opts = Optionals{ intOpt: null, boolOpt: null, addrOpt: null, strOpt: null };
    }
}
