struct InnerOpt {
    v: Int?;
}

struct Wrap2 {
    i: InnerOpt?;
}

contract NullableNest {
    wrap: Wrap2;

    init() {
        self.wrap = Wrap2{
            i: null,
        };
    }
}