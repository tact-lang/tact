struct LeafO {
    x: Int?;
}

struct OuterO {
    inner: LeafO?;
}

contract NestedOptOpt {
    val: OuterO;

    init() {
        self.val = OuterO{
            inner: null
        };
    }
}