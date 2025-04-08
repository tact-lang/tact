struct ManyOptionalStruct {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: Int?;
    o6: Bool?;
}

contract OptionalStructsTest {
    s1: ManyOptionalStruct;
    s2: ManyOptionalStruct;
    init() {
        self.s1 = ManyOptionalStruct{ o1:null,o2:2,o3:true,o4:null,o5:5,o6:false };
        self.s2 = ManyOptionalStruct{ o1:1,o2:null,o3:null,o4:false,o5:null,o6:true };
    }
}