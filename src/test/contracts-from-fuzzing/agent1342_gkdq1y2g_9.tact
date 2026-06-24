struct ManyOpt {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract ManyOptionals {
    data: ManyOpt;

    init() {
        self.data = ManyOpt{
            a: null,
            b: 2,
            c: true,
            d: null,
            e: null,
            f: null
        };
    }
}