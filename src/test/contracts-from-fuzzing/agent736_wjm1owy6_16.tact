struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract TestContract {
    mo: ManyOptionals = ManyOptionals{a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null, i:null};

    init() {
        self.mo = ManyOptionals{a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null, i:null};
    }

    receive() {
        dump(self.mo.d);
    }
}