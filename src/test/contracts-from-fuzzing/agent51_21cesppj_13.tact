struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptInNested {
    a: OuterOpt;

    init() {
        self.a = OuterOpt{ inner: null };
    }
}