struct Top {
    a: Int;
    b: NestedOpt?;
}

struct NestedOpt {
    c: Int?;
    d: Bool?;
}

contract NestedOptionalFields {
    val: Top;
    init() {
        self.val = Top{
            a: 5,
            b: NestedOpt{
                c: null,
                d: true,
            }
        };
    }
}