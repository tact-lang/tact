struct NestedPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

struct Wrapper {
    wrapped: NestedPrimitives;
    flag: Bool;
}

contract NestedPrimitivesWrap {
    store: Wrapper;

    init() {
        self.store = Wrapper{
            wrapped: NestedPrimitives{
                a: 1,
                b: true,
                c: "s",
                d: emptyCell().asSlice(),
                e: emptyCell(),
                f: myAddress()
            },
            flag: false
        };
    }
}
