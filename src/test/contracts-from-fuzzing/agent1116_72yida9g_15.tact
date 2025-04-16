struct BigOpt {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
}

contract ManyOptBools {
    bs: BigOpt;

    init() {
        self.bs = BigOpt{
            a:true,b:null,c:false,d:null,
            e:null,f:true,g:null,h:false
        };
    }
}