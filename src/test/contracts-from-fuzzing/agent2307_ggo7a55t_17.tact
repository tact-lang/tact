struct StrNest {
    a: String;
    b: Str2;
}

struct Str2 {
    inner: String?;
}

contract StringDeep {
    s: StrNest;

    init() {
        self.s = StrNest{
            a: "hello",
            b: Str2{inner: null}
        };
    }
}
