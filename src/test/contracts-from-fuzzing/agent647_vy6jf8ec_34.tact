struct BigNest {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct OuterBig {
    x: BigNest;
    y: BigNest;
}

contract DoubleBig {
    one: OuterBig;
    two: OuterBig;

    init() {
        self.one = OuterBig{
            x: BigNest{a:1,b:true,c:"x",d:null,e:false,f:null},
            y: BigNest{a:2,b:false,c:"y",d:3,e:null,f:"z"}
        };
        self.two = OuterBig{
            x: BigNest{a:4,b:true,c:"a",d:null,e:true,f:"b"},
            y: BigNest{a:5,b:false,c:"c",d:6,e:null,f:null}
        };
    }
}