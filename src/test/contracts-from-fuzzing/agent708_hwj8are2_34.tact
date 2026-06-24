struct Full {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MixedOptionalFull {
    val: Full;
    init() {
        self.val = Full{
            a:1,b:"b",c:true,d:null,e:null,f:null
        };
    }
}