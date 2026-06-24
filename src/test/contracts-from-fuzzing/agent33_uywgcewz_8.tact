struct ManyNestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
    e: Cell?;
    f: String?;
    g: Inner?;
}

struct Inner {
    h: Int?;
    i: Bool?;
    j: String?;
}

contract TestContract {
    data: ManyNestedOptionals;

    init() {
        self.data = ManyNestedOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: Inner{
                h: null,
                i: true,
                j: "ok",
            },
        };
    }
}