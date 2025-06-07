contract DeepOptionalNest {
    intOpt: Int?;
    strOpt: String?;
    innerOpt: Inner?;

    init() {
        self.intOpt = null;
        self.strOpt = null;
        self.innerOpt = null;
    }
}

struct Inner {
    level: Int;
    desc: String?;
}