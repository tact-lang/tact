struct Combo {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool?;
    g: Int?;
}

contract FinalBenefit {
    c: Combo;

    init() {
        self.c = Combo{
            a:1,b:true,c:null,d:false,e:42,f:true,g:null
        };
    }
}