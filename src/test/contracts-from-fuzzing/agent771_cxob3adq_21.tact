struct Weird {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract UnusualMix {
    w: Weird = Weird{
        a:1, b:null, c:"hi", d:null, e:true, f:null
    };

    init() {
        self.w = Weird{
            a:2, b:true, c:"bye", d:3, e:false, f:"ok"
        };
    }
}