struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Inner?;
}

struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructField {
    n: NestedOptionals;

    init() {
        self.n = NestedOptionals{
            a: null,
            b: null,
            c: null,
            d: Inner{foo: null, bar: null}
        };
    }
}