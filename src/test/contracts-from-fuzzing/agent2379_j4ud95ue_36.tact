struct ManyOptional {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: String?;
    o5: Bool?;
    o6: Bool?;
}

contract Test {
    m: ManyOptional;

    init() {
        self.m = ManyOptional{
            o1:null, o2:null, o3:null, o4:null, o5:null, o6:null
        };
    }
}