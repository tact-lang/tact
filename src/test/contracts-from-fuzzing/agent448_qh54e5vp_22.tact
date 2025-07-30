struct CrazyNestedOpt {
    a: Int?;
    b: Bool?;
}

struct Wrap {
    crazy: CrazyNestedOpt?;
}

contract OptionalInOptional {
    w: Wrap;
    init() {
        self.w = Wrap{ crazy: CrazyNestedOpt{ a: null, b: true } };
    }
}