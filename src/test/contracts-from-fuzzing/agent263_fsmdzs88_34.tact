struct OptionalAddr {
    a: Address?;
    b: Cell?;
    c: Slice?;
}

contract AllNullsAddr {
    data: OptionalAddr;
    init() {
        self.data = OptionalAddr{a:null, b:null, c:null};
    }
}