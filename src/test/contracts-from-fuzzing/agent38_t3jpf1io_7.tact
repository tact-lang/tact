struct SparseStruct {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool?;
    e: Int;
}

contract SparseOptionals {
    data: SparseStruct;

    init() {
        self.data = SparseStruct{
            a: 1,
            b: null,
            c: 2,
            d: true,
            e: 3,
        };
    }
}