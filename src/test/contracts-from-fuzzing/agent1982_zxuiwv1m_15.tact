struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract ManyOptionals {
    data: ManyOptional;

    init() {
        self.data = ManyOptional {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}