struct MidStruct {
    data: Int;
    flag: Bool;
}

contract Arrayish {
    s1: MidStruct;
    s2: MidStruct;
    s3: MidStruct;
    s4: MidStruct;
    init() {
        self.s1 = MidStruct{ data:1, flag:true };
        self.s2 = MidStruct{ data:2, flag:false };
        self.s3 = MidStruct{ data:3, flag:true };
        self.s4 = MidStruct{ data:4, flag:false };
    }
}