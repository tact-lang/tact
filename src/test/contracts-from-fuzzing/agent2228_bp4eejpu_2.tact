struct Deep {
    a: Int;
    b: Int?;
    c: Inner;
}

struct Inner {
    i: Int?;
    j: Bool;
}

contract DeepNestedField {
    field: Deep;

    init() {
        self.field = Deep{
            a: 5,
            b: null,
            c: Inner{
                i: null,
                j: true,
            },
        };
    }
}
