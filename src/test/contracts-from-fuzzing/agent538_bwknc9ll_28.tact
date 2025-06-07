struct InnerOpt {
    v: Int?;
}

contract DefaultOptInner {
    f: InnerOpt = InnerOpt{v: null};

    init() {
        self.f = InnerOpt{v:null};
    }
}