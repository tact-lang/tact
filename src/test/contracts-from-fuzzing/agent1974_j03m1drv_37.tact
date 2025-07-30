struct Leaf {
    a: Int;
    b: Bool;
    c: Int?;
}

struct Middle {
    l1: Leaf; 
    l2: Leaf; 
}

struct Root {
    m1: Middle;
    m2: Middle;
    val: Int;
}

contract ComplexTree {
    data: Root;

    init() {
        self.data = Root{
            m1: Middle{
                l1: Leaf{ a:1, b:true, c:null },
                l2: Leaf{ a:2, b:false, c:3 }
            },
            m2: Middle{
                l1: Leaf{ a:4, b:true, c:null },
                l2: Leaf{ a:5, b:false, c:6 }
            },
            val: 42
        };
    }
}
