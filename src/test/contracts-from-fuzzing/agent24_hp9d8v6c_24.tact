struct InnerOptional {
    a: Int?;
    b: Bool?;
}

struct OuterOptional {
    c: InnerOptional?;
}

contract OptionalCascade {
    s: OuterOptional;

    init() {
        self.s = OuterOptional{
            c: null,
        };
    }
}