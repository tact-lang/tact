struct NestedSlice {
    s: Slice as remaining;
}

struct Comb {
    sliceOpt: Slice?;
    nestedOpt: NestedSlice?;
    dataInt: Int;
}

contract TestContract {
    store: Comb;

    init() {
        self.store = Comb{
            sliceOpt: null,
            nestedOpt: null,
            dataInt: 100
        };
    }
}