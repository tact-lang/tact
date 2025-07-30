struct OptNested {
    a: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    b: Bool?;
    addr: Address?;
    str: String?;
    cell: Cell?;
}

contract NestedNullable {
    field: OptNested;

    init() {
        self.field = OptNested{
            a: null,
            inner: null
        };
    }
}