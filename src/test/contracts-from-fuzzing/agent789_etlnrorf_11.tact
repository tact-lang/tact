struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
}

contract NestedOptionalsFields {
    opt: NestedOptionals;
    init() {
        self.opt = NestedOptionals{
            a: null,
            b: true,
            c: null,
            d: emptyCell().asSlice(),
            e: null
        };
    }
}