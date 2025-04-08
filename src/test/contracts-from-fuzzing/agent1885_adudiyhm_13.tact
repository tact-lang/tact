struct Primitives {
    i: Int;
    b: Bool;
    s: String;
}

struct Composite {
    a: Address;
    c: Cell;
    sl: Slice;
    p: Primitives;
}

contract NestedComposite {
    data: Composite;

    init() {
        self.data = Composite{
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            p: Primitives{
                i: 99,
                b: false,
                s: "hi"
            }
        };
    }
}