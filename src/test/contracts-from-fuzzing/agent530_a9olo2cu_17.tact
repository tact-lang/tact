struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOpt {
    inner: OptionalNested?;
}

contract TestOptNested {
    fld: OuterOpt;

    init() {
        self.fld = OuterOpt{
            inner: OptionalNested{
                a: null,
                b: true,
                c: null
            }
        };
    }
}
