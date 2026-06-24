struct S {
    f: Int?;
}

contract OptionalsDefaultStruct {
    opt: S = S{f:null};

    init() {
        self.opt = S{f: null};
    }
}
