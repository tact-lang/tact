struct Container {
    data: Cell;
    bits: Slice;
    ok: Bool;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            data: emptyCell(),
            bits: emptyCell().asSlice(),
            ok: true
        };
    }
}