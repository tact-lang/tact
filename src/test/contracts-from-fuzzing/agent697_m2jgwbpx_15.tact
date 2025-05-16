struct MixTypes {
    anInt: Int;
    aBool: Bool;
    aStr: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract Test {
    rec: MixTypes = MixTypes{
        anInt:1,aBool:true,aStr:"A",optInt:null,optBool:null,optStr:null
    };

    init() {
        self.rec = MixTypes{
            anInt:42,aBool:false,aStr:"B",optInt:5,optBool:true,optStr:"X"
        };
    }

    receive() {}
}