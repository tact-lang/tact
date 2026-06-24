struct FlatStruct {
    int1:Int;
    int2:Int;
    int3:Int;
    str1:String;
    bool1:Bool;
    bool2:Bool;
    optBool:Bool?;
    optInt:Int?;
    optString:String?;
}

contract FlatFields {
    data:FlatStruct;

    init() {
        self.data=FlatStruct{
            int1:1,
            int2:2,
            int3:3,
            str1:"hello",
            bool1:true,
            bool2:false,
            optBool:null,
            optInt:null,
            optString:"test"
        };
    }
}