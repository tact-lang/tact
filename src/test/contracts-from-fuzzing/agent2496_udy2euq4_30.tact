struct SOptional {
    inner: InnerS?;
}

struct InnerS {
    s: String;
    flag: Bool;
}

contract OptStructNestedInside {
    f: SOptional;

    init() {
        self.f = SOptional{
            inner: null
        };
    }
}
