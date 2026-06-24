struct SDefaultOpt {
    a: Int?;
}

contract DefaultOpt {
    s: SDefaultOpt;
    init() {
        self.s = SDefaultOpt{a:null};
    }
}