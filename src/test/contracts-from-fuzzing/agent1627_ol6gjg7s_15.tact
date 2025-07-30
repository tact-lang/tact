struct LotOfOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;

}

contract LotOfOptionalsContract {
    data: LotOfOptionals;

    init() {
        self.data = LotOfOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}
