struct HasManyOptionalNests {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Cell?;
    e: Address?;
}

struct WrapOptNests {
    wa: HasManyOptionalNests?;
    wb: HasManyOptionalNests?;
}

contract ComplexNesting {
    s: WrapOptNests;

    init() {
        self.s = WrapOptNests{
            wa: null,
            wb: null
        };
    }
}