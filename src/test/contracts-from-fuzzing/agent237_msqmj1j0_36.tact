struct Scalars {
    i: Int;
    s: String;
    b: Bool;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract FullScalarPersist {
    val: Scalars;
    init() {
        self.val = Scalars{
            i:123,s:"abc",b:true,c:emptyCell(),sl:beginCell().endCell().asSlice(),a:myAddress()
        };
    }
}