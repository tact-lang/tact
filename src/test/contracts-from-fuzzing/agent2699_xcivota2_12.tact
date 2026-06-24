struct StrNest1 {
    v1: String;
    v2: String?;
}

struct StrNest2 {
    inner: StrNest1;
    val: Bool;
}

struct StrNest3 {
    d: StrNest2;
}

contract StringDeepNested {
    big: StrNest3;
    init() {
        self.big = StrNest3{
            d: StrNest2{
                inner: StrNest1{
                    v1: "Hi",
                    v2: null,
                },
                val: true,
            },
        };
    }
}