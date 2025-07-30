struct MixedPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
}

contract PrimitivesMix {
    data: MixedPrimitives;
    init() {
        self.data = MixedPrimitives{
            a:1,
            b:true,
            c:myAddress(),
            d:emptyCell(),
            e:emptyCell().asSlice()
        };
    }
}