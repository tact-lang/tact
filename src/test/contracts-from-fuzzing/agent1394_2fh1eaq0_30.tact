struct LargeStruct {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    int6: Int;
    int7: Int;
    int8: Int;
    int9: Int;
    int10: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    s1: String;
    s2: String;
}

contract LargeVars {
    field1: LargeStruct;
    field2: LargeStruct;

    init() {
        self.field1 = LargeStruct{
            int1:1,int2:2,int3:3,int4:4,int5:5,int6:6,int7:7,int8:8,int9:9,int10:10,
            b1:true,b2:false,b3:true,s1:"hi",s2:"ho"
        };
        self.field2 = LargeStruct{
            int1:11,int2:12,int3:13,int4:14,int5:15,int6:16,int7:17,int8:18,int9:19,int10:20,
            b1:false,b2:true,b3:false,s1:"yo",s2:"ya"
        };
    }
}