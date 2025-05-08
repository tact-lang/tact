struct ManyOpts {
    o1: Int?;
    o2: Bool?;
    o3: Cell?;
    o4: Slice?;
    o5: String?;
    o6: Address?;
}

contract TestContract {
    v1: ManyOpts;
    v2: ManyOpts?;

    init() {
        self.v1 = ManyOpts{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
        self.v2 = null;
    }
}
