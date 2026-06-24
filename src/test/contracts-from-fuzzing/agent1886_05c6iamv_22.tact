struct LongChain {
    a: Node;
}

struct Node {
    next: NextNode;
}

struct NextNode {
    val: Int;
}

contract TestLongChain {
    data: LongChain;

    init() {
        self.data = LongChain{
            a: Node{
                next: NextNode{
                    val: 42
                }
            }
        };
    }
}