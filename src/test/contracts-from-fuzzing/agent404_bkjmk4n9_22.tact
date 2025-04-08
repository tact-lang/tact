struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Int?;
}

struct Middle {
    i1: Inner1;
    i2: Inner2;
    e: Bool?;
}

struct Root {
    m: Middle;
    val: Int;
}

contract Complex {
    root: Root;
    init() {
        self.root = Root{
            m: Middle{
                i1: Inner1{a:1,b:true},
                i2: Inner2{c:"str",d:null},
                e: null
            },
            val: 42
        };
    }
}