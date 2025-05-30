struct PartialOpt {
    a: Int?;
    b: String?;
}

contract PartialAssign {
    p: PartialOpt;

    init() {
        self.p = PartialOpt{a:null,b:null};
        self.p = PartialOpt{a:5,b:null};
    }
}