struct BoolNest {
    inner: BoolInner;
}
struct BoolInner {
    flag: Bool;
}

contract NestedBoolPersist {
    state: BoolNest;

    init() {
        self.state = BoolNest{
            inner: BoolInner{ flag: true }
        };
    }
}