struct InnerOpt { val: Int?; }

struct OuterWDefault {
    nested: InnerOpt? = InnerOpt{ val: null };
}

contract WeirdOpt {
    v: OuterWDefault;

    init() {
        self.v = OuterWDefault{};
    }
}