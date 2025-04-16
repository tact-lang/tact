// Testing a struct with many optional primitive fields
struct LotsOfNulls {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Address?;
    f: Address?;
    g: Cell?;
    h: Cell?;
    i: String?;
    j: String?;
}

contract TestContract {
    bigOptional: LotsOfNulls;

    init() {
        self.bigOptional = LotsOfNulls{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
