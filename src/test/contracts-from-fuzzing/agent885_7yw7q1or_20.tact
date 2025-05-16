// Struct with optional slice and optional cell fields
struct Optionals {
    c: Cell?;
    s: Slice?;
}

contract SliceCellOpt {
    data: Optionals;

    init() {
        self.data = Optionals {
            c: null,
            s: emptyCell().asSlice()
        };
    }
}
