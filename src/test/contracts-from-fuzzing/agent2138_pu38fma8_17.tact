struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
}

contract DeepOptionals {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: 1,
            c: null,
            d: 2,
            e: null,
            f: true,
            g: null,
            h: false,
        };
    }
}