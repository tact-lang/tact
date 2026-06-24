struct Deeply {
    a: Int;
    b: Middle;
}

struct Middle {
    c: Bool;
    d: Leaf;
}

struct Leaf {
    e: String;
    f: Bool?;
}

contract DeepOrder {
    val: Deeply;

    init() {
        self.val = Deeply{
            a:1,
            b: Middle{
                c:true,
                d: Leaf{
                    e:"ok",
                    f:null
                }
            }
        };
    }
}