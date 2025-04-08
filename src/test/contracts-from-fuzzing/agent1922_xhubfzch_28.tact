struct WithOptional {
    opt: Int?;
}

contract OptionalUninit {
    s: WithOptional;

    init() {
        self.s = WithOptional{opt:null};
    }
}