struct ManyPrimitives {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
}

contract TestContract {
    field: ManyPrimitives;

    init() {
        self.field = ManyPrimitives{
            i: 7,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "hello"
        };
    }
}