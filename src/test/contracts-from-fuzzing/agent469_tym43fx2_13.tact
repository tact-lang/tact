struct InnerOpt {
    s: String?;
}

contract NestedOptFields {
    opt1: InnerOpt?;
    opt2: String?;

    init() {
        self.opt1 = InnerOpt{ s: null };
        self.opt2 = "data";
    }
}