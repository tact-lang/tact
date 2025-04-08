struct Alternating {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool?;
    e: Int;
    f: Bool?;
    g: Int;
    h: Bool?;
}

contract Test {
    s: Alternating;

    init() {
        self.s = Alternating{
            a:1,b:null,c:2,d:null,e:3,f:null,g:4,h:null
        };
    }
}