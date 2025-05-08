struct DoubleWrapped {
    inner: Int?;
}

struct OuterWrapper {
    wrapper: DoubleWrapped?;
}

contract DoubleOptTable {
    cell: OuterWrapper;

    init() {
        self.cell = OuterWrapper{wrapper:null};
    }
}
