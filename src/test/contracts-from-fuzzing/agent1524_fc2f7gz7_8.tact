// mixing many optional nested fields
struct InnerNested {
    s: String?;
    c: Cell?;
}

struct OuterNested {
    inner: InnerNested?;
    a: Int?;
    b: Bool?;
}

contract OptNested {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            inner: InnerNested{ s: null, c: emptyCell() },
            a: null,
            b: true
        };
    }
}