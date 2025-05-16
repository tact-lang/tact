struct OptionalComplex {
    lvl: InnerComp?;
}

struct InnerComp {
    num: Int?;
    flag: Bool?;
    txt: String?;
    sli: Slice?;
}

contract OptionComplex {
    data: OptionalComplex;

    init() {
        self.data = OptionalComplex{ lvl: null };
    }
}