struct Inner {
    cellVal: Cell?;
    sliceVal: Slice?;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{ cellVal: null, sliceVal: null };
    }
}