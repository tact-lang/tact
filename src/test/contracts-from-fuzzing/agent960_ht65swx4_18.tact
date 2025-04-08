struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixUse {
    p1: Mix;
    p2: Mix;
    init() {
        self.p1 = Mix{a:1,b:true,c:"x",d:null,e:null,f:null};
        self.p2 = Mix{a:2,b:false,c:"y",d:3,e:true,f:null};
    }
}