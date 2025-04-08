struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Slice?;
}

contract LargeOptStruct {
    x: ManyOptionals;

    init() {
        self.x = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}