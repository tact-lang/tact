struct Mix {
    n: Int;
    s: String;
    b: Bool;
    oInt: Int?;
    oStr: String?;
    oBool: Bool?;
}

contract Combo {
    m1: Mix;
    m2: Mix;

    init() {
        self.m1 = Mix{
            n:1,s:"a",b:true,oInt:null,oStr:null,oBool:null
        };
        self.m2 = Mix{
            n:2,s:"b",b:false,oInt:3,oStr:"zzz",oBool:true
        };
    }
}