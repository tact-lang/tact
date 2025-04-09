struct OnlyOptionals {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    addr: Address?;
    cell: Cell?;
}

contract OptionalStructFieldTest {
    nestedOpt: OnlyOptionals;

    init() {
        self.nestedOpt = OnlyOptionals{
            foo: null,
            bar: null,
            baz: null,
            addr: null,
            cell: null,
        };
    }
}