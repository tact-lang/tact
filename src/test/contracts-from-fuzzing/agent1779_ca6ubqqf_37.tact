struct NestedRemain {
    inner: InnerRemain;
}
struct InnerRemain {
    suffix: Cell as remaining;
}

contract NestedRemainContract {
    data: NestedRemain;
    init() {
        self.data = NestedRemain{inner: InnerRemain{suffix: emptyCell()}};
    }
}