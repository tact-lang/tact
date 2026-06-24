struct PrimitiveMix {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
}

contract PrimitiveMixTest {
    mix: PrimitiveMix;

    init() {
        self.mix = PrimitiveMix{
            a:1,
            b:true,
            c:myAddress(),
            d:emptyCell(),
            e:"abc",
        };
    }
}