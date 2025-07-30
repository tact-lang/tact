struct ManyBoolOpt {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
}

contract ManyBoolOptC {
    v: ManyBoolOpt;

    init() {
        self.v = ManyBoolOpt{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null
        };
    }
}