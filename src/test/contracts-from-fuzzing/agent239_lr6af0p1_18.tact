struct OptAddr {
    addr: Address?;
}

struct OptSliceCell {
    slice: Slice?;
    cell: Cell?;
}

struct ComboNestedOpt {
    inner1: OptAddr?;
    inner2: OptSliceCell?;
}

contract ComboOptionalContract {
    compound: ComboNestedOpt;

    init() {
        self.compound = ComboNestedOpt{ inner1:null, inner2:null };
    }
}