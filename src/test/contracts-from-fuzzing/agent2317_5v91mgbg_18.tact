struct OuterOpt {
    sub: InnerOpt;
    val: Int?;
}

struct InnerOpt {
    a: Int?;
    b: String?;
}

contract NestedOpts {
    info: OuterOpt;

    init() {
        self.info = OuterOpt{
            sub: InnerOpt{a: null, b: null},
            val: null
        };
    }
}