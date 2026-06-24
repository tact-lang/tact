struct ExtraOptional {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

contract ManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Cell?;
    opt4: Slice?;
    opt5: Address?;
    opt6: String?;
    nested: ExtraOptional;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
        self.opt4 = null;
        self.opt5 = null;
        self.opt6 = null;
        self.nested = ExtraOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}
