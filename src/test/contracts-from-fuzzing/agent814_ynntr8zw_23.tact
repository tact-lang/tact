// struct with many primitive optional fields
struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
    g: Address?;
    h: Address?;
    i: Cell?;
    j: Cell?;
}

contract LargeOptStruct {
    optData: ManyOptionals;

    init() {
        self.optData = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
