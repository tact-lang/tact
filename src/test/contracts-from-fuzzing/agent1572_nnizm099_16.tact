// Struct with nesting and optional struct containing optional fields
struct Leaf {
    val1: Int?;
    val2: Bool?;
}

struct Middle {
    leaf1: Leaf?;
    leaf2: Leaf;
}

struct Root {
    mid1: Middle;
    mid2: Middle?;
    ok: Bool;
}

contract OptionUltimate {
    root: Root = Root{
        mid1: Middle{leaf1:null, leaf2:Leaf{val1:null, val2:null}},
        mid2: null,
        ok: false
    };

    init() {
        self.root = Root{
            mid1: Middle{leaf1:Leaf{val1:7,val2:true}, leaf2:Leaf{val1:null,val2:false}},
            mid2: Middle{leaf1:null, leaf2:Leaf{val1:1,val2:null}},
            ok: true
        };
    }
}
