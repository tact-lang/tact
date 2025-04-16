struct ManyDifferentPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract ManyPrims {
    data: ManyDifferentPrimitives;

    init() {
        self.data = ManyDifferentPrimitives{
            i:5,
            b:true,
            s:"test",
            c:emptyCell(),
            sl:emptyCell().asSlice(),
            bu:beginCell(),
            a:myAddress()
        };
    }
}