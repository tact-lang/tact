struct Node2 {
    payload: Int;
}
struct Node1 {
    inner: Node2;
}

contract NestedShortChain {
    root: Node1;

    init() {
        self.root = Node1{inner:Node2{payload:123}};
    }
}