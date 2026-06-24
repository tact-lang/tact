struct BoolNest {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract TestContract {
    flags: BoolNest;

    init() {
        self.flags = BoolNest{
            a:true,b:false,c:true,d:false,
            e:true,f:false,g:true,h:false
        };
    }
}