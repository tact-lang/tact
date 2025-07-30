struct Alpha {
    foo: Int;
}

struct Beta {
    bar: Bool;
}

struct Gamma {
    baz: String;
}

contract NestedMultitype {
    a: Alpha;
    b: Beta;
    c: Gamma;

    init() {
        self.a = Alpha{foo: 1};
        self.b = Beta{bar: false};
        self.c = Gamma{baz: ""};
    }
}