struct WideStruct {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    bool5: Bool;
    str1: String;
    str2: String;
    str3: String;
    str4: String;
    str5: String;
}

contract WideStructStorage {
    val: WideStruct;

    init() {
        self.val = WideStruct{
            int1:1,int2:2,int3:3,int4:4,int5:5,
            bool1:true,bool2:false,bool3:true,bool4:false,bool5:true,
            str1:"a",str2:"b",str3:"c",str4:"d",str5:"e"
        };
    }
}