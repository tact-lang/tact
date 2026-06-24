struct OuterOpt {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    b: Bool;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ innerOpt: null };
    }
}