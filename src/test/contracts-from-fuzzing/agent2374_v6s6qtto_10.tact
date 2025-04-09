struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptGroups {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            a: null,
            b: false,
            c: null,
            d: emptyCell(),
            e: null,
            f: myAddress(),
        };
    }
}