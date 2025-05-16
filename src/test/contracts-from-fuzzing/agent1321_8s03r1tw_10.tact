struct BoolMix {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
    f: Int;
    g: Bool;
    h: Int;
}

contract BoolFields {
    m: BoolMix;
    init() {
        self.m = BoolMix{
            a:true,b:1,c:false,d:2,e:true,f:3,g:false,h:4
        };
    }
}