struct ManyBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BoolCompTest {
    flags: ManyBools = ManyBools{ a:false, b:true, c:false, d:true, e:false, f:true, g:false, h:true };

    init() {
        self.flags = ManyBools{ a:true, b:false, c:true, d:false, e:true, f:false, g:true, h:false };
    }
}
