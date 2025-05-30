struct Node {
    val: Int;
    child: ChildNode;
}
struct ChildNode {
    val: Bool;
}

contract OptDeepNested {
    optRoot: Node?;

    init() {
        self.optRoot = null;
    }
}