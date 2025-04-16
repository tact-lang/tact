struct InnerOpt {
    f1: Int?;
    f2: Bool?;
}

contract OptStructVar {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{f1:null,f2:true};
    }
}
