struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
    f: Cell?;
    g: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}