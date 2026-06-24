struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Bool?;
}

contract OptionalsTest {
    info: ManyOptionals;

    init() {
        self.info = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}