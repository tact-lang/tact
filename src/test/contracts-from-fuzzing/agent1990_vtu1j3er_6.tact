struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract ManyOptionals {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}
