struct StructWithRef {
    s: Slice;
    c: Cell;
}

contract RefStorage {
    val: StructWithRef;

    init() {
        self.val = StructWithRef{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}
