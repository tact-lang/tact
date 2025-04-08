struct OptBig {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract OptBigState {
    bigOptVar: OptBig;

    init() {
        self.bigOptVar = OptBig{
            a:null,b:2,c:null,d:4,e:null,f:6,g:null,h:8,i:null,j:10
        };
    }
}