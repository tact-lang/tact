struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract OptStructTest {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}