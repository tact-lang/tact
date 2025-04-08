struct LargeOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Bool?;
    h: Bool?;
    i: Bool?;
    j: Bool?;
}

contract OptionalsHeavy {
    data: LargeOptionals;

    init() {
        self.data = LargeOptionals{
            a: null,
            b: 2,
            c: null,
            d: 4,
            e: null,
            f: 6,
            g: null,
            h: false,
            i: null,
            j: true
        };
    }
}