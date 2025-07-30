struct ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    j: Bool;
}

contract BoolStructs {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{
            a:true, b:false, c:true, d:false, e:true, f:false, g:true, h:false, j:true
        };
    }
}