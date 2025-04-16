struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract TestContract {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            a:null, b:null, c:null, d:null,
            e:1, f:2, g:null, h:3,
        };
    }
}