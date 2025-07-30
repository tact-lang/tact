struct BigOptional {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Int?;
    o5: Bool?;
    o6: String?;
}

contract BigOpt {
    val: BigOptional;
    init() {
        self.val = BigOptional{
            o1:null, o2:null, o3:null,
            o4:null, o5:null, o6:null
        };
    }
}