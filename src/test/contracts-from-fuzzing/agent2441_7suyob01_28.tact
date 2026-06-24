struct DeepOptRec {
    foo: Int?;
    bar: Int?;
}

struct DeepOptCont {
    rec: DeepOptRec?;
    add: Bool?;
    misc: String?;
}

contract RecursiveOpt {
    val: DeepOptCont?;

    init() {
        self.val = null;
    }
}