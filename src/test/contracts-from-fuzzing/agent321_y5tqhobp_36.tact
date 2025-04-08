struct NestedManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;
    g: Address?;
    h: Slice?;
    i: Cell?;
}

contract NestedOptContract {
    data: NestedManyOptional;
    init() {
        self.data = NestedManyOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
        };
    }
}