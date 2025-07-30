struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract NestedOptionalContract {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}