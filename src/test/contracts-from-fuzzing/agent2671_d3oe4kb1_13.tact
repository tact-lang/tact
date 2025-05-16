struct AddrAndSlices {
    a: Address;
    b: Slice;
    c: Address?;
    d: Slice?;
}

contract AddrSliceContract {
    state: AddrAndSlices;

    init() {
        self.state = AddrAndSlices{
            a: myAddress(),
            b: emptyCell().asSlice(),
            c: null,
            d: null
        };
    }
}