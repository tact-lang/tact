struct Cont {
    a: Int?;
    b: Bool?;
    c: Inner;
}

struct Inner {
    d: Int?;
    e: Leaf?;
}

struct Leaf {
    f: Bool;
    g: String?;
}

contract OptionalDeep {
    root: Cont;

    init() {
        self.root = Cont{
            a:null,
            b:true,
            c:Inner{
                d:null,
                e:Leaf{
                    f:false,
                    g:null
                }
            }
        };
    }
}
