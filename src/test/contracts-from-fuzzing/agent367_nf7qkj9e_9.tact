struct Optionals {
    a: Int?; 
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestOpt {
    data: Optionals;

    init() {
        self.data = Optionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}