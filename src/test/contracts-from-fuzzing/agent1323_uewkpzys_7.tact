struct NullableDeep {
    a: Int?;
    inner: Nested?;
}

struct Nested {
    b: Int?;
    deepest: Deepest?;
}

struct Deepest {
    c: Int?;
}

contract NullableNestedFields {
    s: NullableDeep;

    init() {
        self.s = NullableDeep{
            a:null,
            inner: null
        };
    }
}
