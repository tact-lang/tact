// test many nested optionals in structs
struct Sopt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct SuperOpt {
    s1: Sopt?;
    s2: Sopt?;
    s3: Sopt?;
}

contract MegaOpts {
    data: SuperOpt;

    init() {
        self.data = SuperOpt{ s1: null, s2: null, s3: null };
    }
}