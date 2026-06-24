struct ManyOpts {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Int?;
    o5: Bool?;
}

contract MassOpts {
    data: ManyOpts;
    init() {
        self.data = ManyOpts{
            o1:null,o2:null,o3:true,o4:42,o5:false
        };
    }
}