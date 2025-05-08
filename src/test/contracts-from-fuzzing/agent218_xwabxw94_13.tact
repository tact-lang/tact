struct SparseOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract SparseOptTest {
    so: SparseOpt;

    init() {
        self.so = SparseOpt{
            a: null,
            b: true,
            c: null,
            d: null,
            e: emptyCell()
        };
    }
}