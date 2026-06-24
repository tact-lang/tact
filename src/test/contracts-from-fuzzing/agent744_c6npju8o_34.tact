struct InnerRemain {
    info: Int;
    stuff: Cell as remaining;
}

struct OuterCombo {
    a: Int?;
    b: Bool?;
    c: String?;
    nested: InnerRemain;
}

contract ComplexNestedRemain {
    data: OuterCombo;

    init() {
        self.data = OuterCombo{
            a: null,
            b: null,
            c: null,
            nested: InnerRemain{
                info: 77,
                stuff: emptyCell()
            }
        };
    }
}