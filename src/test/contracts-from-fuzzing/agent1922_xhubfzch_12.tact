struct MixOpt {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
    e: Int?;
}

contract MixedOptionals {
    m: MixOpt;

    init() {
        self.m = MixOpt{
            a:null,b:true,c:1,d:null,e:2
        };
    }
}