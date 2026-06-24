struct OptAddrSlice {
    a: Address?;
    s: Slice?;
}

contract OptAddrSliceContract {
    val: OptAddrSlice;

    init() {
        self.val = OptAddrSlice{a: null, s: null};
    }
}