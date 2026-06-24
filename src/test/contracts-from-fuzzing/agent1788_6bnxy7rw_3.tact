struct Deep {
    a: Int;
    b: Bool;
    c: Int?;
    nested: Inner;
}

struct Inner {
    m: Int;
    n: Bool?;
}

contract DeepNestedStructContract {
    d: Deep = Deep{a: 1, b: true, c: null, nested: Inner{m: 5, n: false}};

    init() {
        self.d = Deep{a: 2, b: false, c: 3, nested: Inner{m: 10, n: null}};
    }
}