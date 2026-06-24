struct WrappedPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract WrappedPrimitivesContract {
    wrap: WrappedPrimitives;
    init() {
        self.wrap = WrappedPrimitives{
            a: 1,
            b: true,
            c: myAddress(),
            d: "str",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}