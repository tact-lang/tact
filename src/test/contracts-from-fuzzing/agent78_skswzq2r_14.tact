struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    opt: InnerOpt?;
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ opt: null };
    }
}