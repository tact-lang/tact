struct NestedPrimitivesOptionals {
    addr: Address?;
    c: Cell?;
    sl: Slice?;
    s: String?;
}

contract NestedPrimitiveOptionalsContract{
    val: NestedPrimitivesOptionals;

    init() {
        self.val = NestedPrimitivesOptionals{
            addr: null,
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            s: "hi"
        };
    }
}