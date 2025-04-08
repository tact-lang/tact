struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
    e: Int?;
    f: Bool?;
    g: Int?;
}

contract WithManyOptionals {
    opts: ManyOptionals = ManyOptionals{a:null, b:null, c:null, d:null, e:null, f:null, g:null};
    
    init() {
        self.opts = ManyOptionals{a:null, b:null, c:null, d:null, e:null, f:null, g:null};
    }
}