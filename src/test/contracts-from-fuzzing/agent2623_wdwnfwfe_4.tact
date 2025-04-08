struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    item: ManyOptionals;

    init() {
        self.item = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}