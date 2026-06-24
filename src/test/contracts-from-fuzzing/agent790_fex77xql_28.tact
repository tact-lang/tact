struct ManyOpt {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
}

contract MultiOpts {
    v: ManyOpt;

    init() {
        self.v = ManyOpt{o1:null,o2:null,o3:null,o4:null};
    }
}