struct InnerRec {
    data: Int;
}

struct ComplexRec {
    inner: InnerRec;
    flag: Bool;
}

contract OptionComplex {
    opt: ComplexRec?;

    init() {
        self.opt = null;
    }
}