struct OptionalSliceCellAddr {
    a: Slice?;
    b: Cell?;
    c: Address?;
}

contract TestContract {
    s: OptionalSliceCellAddr;
    init() {
        self.s = OptionalSliceCellAddr{ a:null, b:null, c:null };
    }
}