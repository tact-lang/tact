struct MixedPrimitives {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    sl: Slice;
}

contract MixedPrimitivesContract {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            i:0,
            b:false,
            a:myAddress(),
            s:"",
            c:emptyCell(),
            sl:emptyCell().asSlice()
        };
    }
}