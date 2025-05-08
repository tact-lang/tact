struct InternalOpt {
    a: Int = 1;
    b: String?;
}

contract PartialAssign {
    s: InternalOpt;

    init() {
        self.s = InternalOpt{ };
    }
}