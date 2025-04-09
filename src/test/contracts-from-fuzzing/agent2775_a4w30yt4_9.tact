struct NestedMany {
    a: Int;
    b: Bool;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract NestedStructStorage {
    field: NestedMany;
    
    init() {
        self.field = NestedMany{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: emptyCell(),
            f: null
        };
    }
}