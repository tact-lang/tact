struct ManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract OptionalsTest {
    lots: ManyOptional;
    
    init() {
        self.lots = ManyOptional{
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