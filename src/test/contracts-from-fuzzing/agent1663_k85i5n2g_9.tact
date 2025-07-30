struct Leaf {
    a: Int;
    b: Bool;
}

struct Middle {
    one: Leaf;
    two: Leaf;
    flag: Bool;
}

struct Root {
    mid1: Middle;
    mid2: Middle;
    val: Int;
}

contract DeeplyNested {
    tree: Root;
    init() {
        self.tree = Root{
            mid1: Middle{one:Leaf{a:1,b:true}, two:Leaf{a:2,b:false}, flag:true},
            mid2: Middle{one:Leaf{a:3,b:false}, two:Leaf{a:4,b:true}, flag:false},
            val: 5
        };
    }
}