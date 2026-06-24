struct Leaf {
    x: Int;
}
struct Mid {
    leaf: Leaf;
}
struct Root {
    mid: Mid;
}
contract TestContract {
    root: Root;
    init() {
        self.root = Root{ mid: Mid{ leaf: Leaf{ x: 42 } } };
    }
}