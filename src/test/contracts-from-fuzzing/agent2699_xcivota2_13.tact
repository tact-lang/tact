struct Opts1 {
    foo: Int?;
    bar: Bool?;
}

struct Opts2 {
    s: Opts1?;
    b: Bool;
}

contract ComplexOptionalLayered {
    f: Opts2?;
    init() {
        self.f = Opts2{
            s: null,
            b: false,
        };
    }
}