struct Mix {
    a: Int;
    b: Int as int64;
    c: Int as uint32;
    d: String;
    e: Bool;
    f: Bool?;
}

contract MixedStruct {
    m: Mix;

    init() {
        self.m = Mix{a:1,b:2,c:3,d:"hi",e:true,f:null};
    }
}
