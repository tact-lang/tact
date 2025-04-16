// Deep nested optional chain assigning non-null to inner optional
struct Leaf {
    value: Int;
}
struct N2 {
    leaf: Leaf?;
}
struct N1 {
    node: N2?;
}

contract ChainAssignInner {
    data: N1;
    init() {
        self.data = N1{
            node: N2{
                leaf: Leaf{value: 5}
            }
        };
    }
}