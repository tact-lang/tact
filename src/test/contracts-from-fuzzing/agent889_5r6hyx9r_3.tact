struct Variety {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Address?;
    f: Cell?;
    g: Slice?;
}

contract VarietyContract {
    var: Variety;

    init() {
        self.var = Variety{
            a: 1,
            b: true,
            c: "test",
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}