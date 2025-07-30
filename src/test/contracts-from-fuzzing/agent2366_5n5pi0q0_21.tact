struct InnerOpt {
    x: Int?;
}

contract ManyInnerOpts {
    f1: InnerOpt;
    f2: InnerOpt;

    init() {
        self.f1 = InnerOpt{x:null};
        self.f2 = InnerOpt{x:null};
    }
}