struct Final {
    s: String?;
    i: Int?;
    b: Bool?;
}

struct MidLayer {
    f1: Final?;
    f2: Final?;
}

contract OptionalFinals {
    m: MidLayer;

    init() {
        self.m = MidLayer{
            f1: null,
            f2: null
        };
    }
}