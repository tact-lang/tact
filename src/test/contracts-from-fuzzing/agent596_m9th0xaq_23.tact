struct MixIntOpt {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
}

contract MixIntOps {
    s: MixIntOpt;

    init() {
        self.s = MixIntOpt{
            a:1,b:null,c:3,d:null,e:5
        };
    }
}