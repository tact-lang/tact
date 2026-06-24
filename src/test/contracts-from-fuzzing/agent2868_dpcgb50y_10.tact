struct HasSlice {
    data: Slice;
}

struct ContainsHasSlice {
    inner: HasSlice;
}

contract NestedSliceStorage {
    cont: ContainsHasSlice;

    init() {
        let cell = emptyCell();
        let sl = cell.asSlice();
        self.cont = ContainsHasSlice{ inner: HasSlice{ data: sl } };
    }
}