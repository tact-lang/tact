struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract OnlyOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: 1,
            b: null,
            c: 3,
            d: null,
            e: 5,
            f: null,
            g: 7,
            h: null,
            i: 9,
            j: null
        };
    }
}
