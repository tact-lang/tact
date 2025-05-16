struct ManyOpts {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: String?;
    o6: String?;
}

contract Test {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            o1:null,o2:null,o3:null,o4:null,o5:null,o6:null
        };
    }
}