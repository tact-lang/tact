struct EmptyInnerOpt {
    v: Int?;
}

struct OuterWithNullableInner {
    inner: EmptyInnerOpt?;
    flag: Bool;
}

contract OptionalStructField {
    s: OuterWithNullableInner;
    init() {
        self.s = OuterWithNullableInner{
            inner: null,
            flag: true
        };
    }
}