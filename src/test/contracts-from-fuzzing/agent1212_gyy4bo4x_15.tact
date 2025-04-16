struct BoolCompress {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract PackedBools {
    b: BoolCompress;

    init() {
        self.b = BoolCompress{
            a:true,b:false,c:true,d:true,e:false,f:true,g:false,h:true
        };
    }
}