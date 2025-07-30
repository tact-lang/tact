struct ComplexLeaf {
    text: String;
    flag: Bool;
    amount: Int;
}

struct Middle {
    a: ComplexLeaf;
    b: ComplexLeaf;
}

struct RootNode {
    m1: Middle;
    m2: Middle;
}

contract Layered {
    root: RootNode;
    init() {
        self.root = RootNode{
            m1: Middle{
                a: ComplexLeaf{text:"a",flag:true,amount:1},
                b: ComplexLeaf{text:"b",flag:false,amount:2}
            },
            m2: Middle{
                a: ComplexLeaf{text:"c",flag:true,amount:3},
                b: ComplexLeaf{text:"d",flag:false,amount:4}
            }
        };
    }
}