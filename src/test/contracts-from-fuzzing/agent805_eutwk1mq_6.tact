struct MixedOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

contract TestContract {
    data: MixedOptional;

    init() {
        self.data = MixedOptional{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: null
        };
    }
}