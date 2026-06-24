struct Complex {
    a: Int as uint64;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int as int16;
    f: Bool;
    g: Int? as uint32;
    h: Bool?;
}

contract Test {
    storage: Complex = Complex{
      a:1, b:true, c:null, d:null,
      e:2, f:false, g:null, h:true
    };
    init() {
        self.storage = Complex{
            a:10, b:false, c:5, d:true,
            e:20, f:true, g:42, h:false
        };
    }
}