struct Leaf {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Middle {
    left: Leaf;
    right: Leaf;
    flag: Bool;
}

struct Root {
    master: Middle;
    extra: Int;
}

contract TestComplex {
    storage: Root;

    init() {
        self.storage = Root{
            master: Middle{
                left: Leaf{ a:1, b:true, c:null },
                right: Leaf{ a:2, b:false, c:3 },
                flag: true
            },
            extra: 42
        };
    }
}
