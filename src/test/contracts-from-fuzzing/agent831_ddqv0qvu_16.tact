struct Inner {
    innermost: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    m: Middle;
    optionalStr: String?;
    optionalInt: Int?;
}

contract Combo {
    field: Outer;

    init() {
        self.field = Outer{
            m: Middle{
                inner: Inner{
                    innermost: 16
                }
            },
            optionalStr: null,
            optionalInt: 123
        };
    }
}