struct ReorderedPrimitives {
    s: String;
    i: Int;
    b: Bool;
    sl: Slice;
    c: Cell;
    a: Address;
}

contract ReorderedPrimitivesContract {
    field: ReorderedPrimitives;

    init() {
        self.field = ReorderedPrimitives{
            s:"hello",
            i:42,
            b:true,
            sl:emptySlice(),
            c:emptyCell(),
            a:myAddress()
        };
    }
}