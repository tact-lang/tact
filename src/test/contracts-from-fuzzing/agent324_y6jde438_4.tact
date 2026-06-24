struct MixedInner {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
}

contract MixedStorage {
    fixedInt: Int;
    fixedBool: Bool;
    fixedString: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    nested: MixedInner;
    optNested: MixedInner?;

    init() {
        self.fixedInt = 10;
        self.fixedBool = true;
        self.fixedString = "hello";
        self.optInt = 20;
        self.optBool = false;
        self.optString = "world";
        self.nested = MixedInner{a:1,b:true,c:"c",d:2};
        self.optNested = MixedInner{a:2,b:false,c:null,d:null};
    }
}