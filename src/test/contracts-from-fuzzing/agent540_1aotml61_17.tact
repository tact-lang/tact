struct InnerOpt {
    s: String?;
}

struct OuterOpt {
    i: Int;
    inOpt: InnerOpt?;
}

contract OptionalStructField {
    x: OuterOpt;

    init() {
        self.x = OuterOpt{ i: 1, inOpt: null };
    }
}