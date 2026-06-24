struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract BoolPacking {
    flags: MultiBool;
    init() {
        self.flags = MultiBool{
            a:true, b:false, c:true, d:false, e:true
        };
    }
}