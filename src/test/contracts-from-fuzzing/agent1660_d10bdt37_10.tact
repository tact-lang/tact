struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract Test10 {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals {
            a: null,
            b: true,
            c: null,
            d: myAddress(),
            e: null,
            f: emptyCell().asSlice(),
        };
    }
}