struct Optionals {
    s: String?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
    b: Bool?;
    i: Int?;
}

contract OptStructHolder {
    optField: Optionals;

    init() {
        self.optField = Optionals{
            s: null,
            c: null,
            sl: null,
            a: null,
            b: null,
            i: null
        };
    }
}