struct ManyOpt {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: String?;
}

contract OptionsStorage {
    opts: ManyOpt;

    init() {
        self.opts = ManyOpt{
            o1:null, o2:true, o3:null, o4:4, o5:"test"
        };
    }
}