struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
}

contract OptionalsContract {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{
            a: 1,
            b: "hello",
            c: true,
            d: null,
            e: null
        };
    }
}