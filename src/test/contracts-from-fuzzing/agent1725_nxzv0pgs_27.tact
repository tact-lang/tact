struct DeepTree {
    a1: Int;
    a2: Int?;
    inner1: InnerNode;
    inner2: InnerOpt;
}

struct InnerNode {
    b1: Int;
    b2: Bool;
}

struct InnerOpt {
    c1: String?;
    c2: Bool?;
}

contract TestContract {
    tree: DeepTree;

    init() {
        self.tree = DeepTree{
            a1:1,a2:null,
            inner1: InnerNode{b1:2,b2:true},
            inner2: InnerOpt{c1:null,c2:false}
        };
    }
}