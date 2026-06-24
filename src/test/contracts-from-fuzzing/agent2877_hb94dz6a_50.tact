struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
}

contract NestedOpts {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}