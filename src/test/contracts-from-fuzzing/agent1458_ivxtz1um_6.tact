struct BigStruct {
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
    int11: Int;
    int12: Int;
}

contract BigStructTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            int1:1,int2:2,int3:3,int4:4,int5:5,int6:6,
            int7:7,int8:8,int9:9,int10:10,int11:11,int12:12
        };
    }
}