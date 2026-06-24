struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Int?;
    f: Bool?;
    g: Int?;
    h: Bool?;
    i: Int?;
    j: Bool?;
}

contract TestContract {
    optionals: ManyOptionals;

    init() {
        self.optionals = ManyOptionals{
            a: null,
            b: 2,
            c: true,
            d: null,
            e: 5,
            f: false,
            g: null,
            h: true,
            i: 9,
            j: null
        };
    }
}
