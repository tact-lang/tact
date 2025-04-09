struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Address?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    foo: ManyOptionals;

    init() {
        self.foo = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}