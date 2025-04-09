struct InnerOpt {
    a: Int;
    b: Int?;
}

contract OptStruct {
    opt: InnerOpt;

    init() {
        self.opt = InnerOpt{ a: 5, b: null };
    }
}