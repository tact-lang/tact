struct LongChain {
    a: Node;
}

struct Node {
    b: Leaf;
}

struct Leaf {
    x: Int;
    y: Bool;
}

contract ChainOfNested {
    root: LongChain;

    init() {
        self.root = LongChain{a:Node{b:Leaf{x:7,y:true}}};
    }
}