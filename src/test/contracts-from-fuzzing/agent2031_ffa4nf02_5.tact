struct LargeStruct {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Bool;
    a7: Bool;
    a8: Bool;
    a9: Bool;
    a10: Bool;
    str1: String;
    str2: String;
    str3: String;
    str4: String;
    str5: String;
}

contract LargeStructContract {
    bigdata: LargeStruct;

    init() {
        self.bigdata = LargeStruct{
            a1:1,a2:2,a3:3,a4:4,a5:5,
            a6:true,a7:false,a8:true,a9:false,a10:true,
            str1:"a",str2:"b",str3:"c",str4:"d",str5:"e",
        };
    }
}