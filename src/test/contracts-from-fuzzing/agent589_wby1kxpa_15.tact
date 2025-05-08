struct Triple {
    a: Int;
    b: Cell;
    c: Slice;
}

struct Wrap {
    first: Triple;
    second: Triple;
}

contract Test {
    val: Wrap;

    init() {
        self.val = Wrap{
            first: Triple{
                a: 1,
                b: emptyCell(),
                c: emptyCell().asSlice(),
            },
            second: Triple{
                a: 2,
                b: emptyCell(),
                c: emptyCell().asSlice(),
            },
        };
    }
}