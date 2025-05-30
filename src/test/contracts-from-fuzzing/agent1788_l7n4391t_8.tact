struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: emptyCell(),
            e: null,
            f: "hello"
        };
    }
}