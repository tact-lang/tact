struct LongStruct {
    a0: Int;
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Bool?;
    a5: Int as uint8;
    a6: String;
    a7: Int?;
    a8: Int;
    a9: Bool;
    a10: Int as uint16;
    a11: Bool?;
    a12: String;
    a13: Int;
    a14: Int as uint32;
}

contract LongStructTest {
    s: LongStruct;
    
    init() {
        self.s = LongStruct{
            a0:1, a1:2, a2:true, a3:"abc", a4:null, a5:3, a6:"def",
            a7:null, a8:8, a9:false, a10:10, a11:true, a12:"ghi", a13:13, a14:14
        };
    }
}