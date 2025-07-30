struct ManyOpts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
}

contract ContractManyOpts {
    m: ManyOpts;

    init() {
        self.m = ManyOpts{ o1:null, o2:null, o3:null, o4:null, o5:null };
    }
}