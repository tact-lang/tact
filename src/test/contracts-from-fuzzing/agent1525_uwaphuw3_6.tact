struct LargeStruct {
    a1: Int;
    a2: Bool;
    a3: Int?;
    a4: Bool?;
    a5: Int;
    a6: Bool;
    a7: Int?;
    a8: Bool?;
    a9: Int;
    a10: Bool;
    a11: Int?;
    a12: Bool?;
    a13: Int;
    a14: Bool;
    a15: Int?;
    a16: Bool?;
}

contract HugeStructTest {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a1:1,a2:true,a3:3,a4:false,a5:5,a6:true,a7:7,a8:false,
            a9:9,a10:true,a11:11,a12:false,a13:13,a14:true,a15:15,a16:false
        };
    }
}