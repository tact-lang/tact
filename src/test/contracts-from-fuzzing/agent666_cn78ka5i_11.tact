struct S1 {
    flag: Bool?;
}

struct S2 {
    val: Int?;
    sub: S1?;
}

contract NestedOpts {
    nested: S2;

    init() {
        self.nested = S2{
            val: null,
            sub: null
        };
    }
}
