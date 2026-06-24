struct AllPrimitiveOptional {
    i: Int?;
    b: Bool?;
    c: Cell?;
    bu: Builder?;
    s: Slice?;
    a: Address?;
    st: String?;
}

contract AllPrimitiveOptionalTest {
    data: AllPrimitiveOptional;

    init() {
        self.data = AllPrimitiveOptional{
            i: null,
            b: null,
            c: null,
            bu: null,
            s: null,
            a: null,
            st: null,
        };
    }
}