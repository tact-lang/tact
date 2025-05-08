struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: String?;
}

contract TestContract {
    mo: ManyOptionals;

    init() {
        self.mo = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}