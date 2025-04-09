struct MessyOption {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Cell;
    f: Slice?;
}

contract MessyState {
    data: MessyOption;
    init() {
        self.data = MessyOption{
            a: null,
            b: false,
            c: null,
            d: null,
            e: emptyCell(),
            f: null
        };
    }
}
