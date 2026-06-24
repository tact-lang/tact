struct Combo {
    anInt: Int;
    optInt: Int?;
    aBool: Bool;
    optBool: Bool?;
    aString: String;
    optString: String?;
}

contract Z {
    c: Combo;

    init() {
        self.c = Combo{
            anInt:1,optInt:null,aBool:true,optBool:null,aString:"a",optString:null
        };
    }
}