struct ManyOptionals {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: Bool?;
    j: Bool?;
}

contract TestContract {
    optflags: ManyOptionals;

    init() {
        self.optflags = ManyOptionals{
            a:true, b:null, c:true, d:null, e:true,
            f:null, g:true, h:null, i:true, j:null
        };
    }
}