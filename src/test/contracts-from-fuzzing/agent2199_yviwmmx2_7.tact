struct BigManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptsTest {
    storage: BigManyOptionals;
    init() {
        self.storage = BigManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: "foo"
        };
    }
}
