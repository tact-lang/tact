struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract Holder {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: null,
            c: true,
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}