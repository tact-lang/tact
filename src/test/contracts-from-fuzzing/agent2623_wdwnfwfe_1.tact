struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract TestContract {
    nested: NestedOptionals;

    init() {
        self.nested = NestedOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}