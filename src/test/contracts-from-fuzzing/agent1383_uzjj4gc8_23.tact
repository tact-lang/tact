struct Wide {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MixedWide {
    w: Wide;
    init() {
        self.w = Wide{
            a:1,b:"x",c:true,d:null,e:null,f:null
        };
    }
}