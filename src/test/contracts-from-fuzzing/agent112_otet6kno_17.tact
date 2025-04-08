struct Mix {
    intv: Int;
    boolv: Bool;
    strv: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract MixStructComplex {
    m: Mix = Mix{
        intv:1, boolv:true, strv:"s",
        optInt:null, optBool:null, optStr:null
    };

    init() {
        self.m = Mix{
            intv:7, boolv:false, strv:"ss",
            optInt:8, optBool:true, optStr:"sss"
        };
    }
}
