struct Container {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    nested: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract OptionalComplex {
    x: Container;
    init() {
        self.x = Container{
            optInt: null,
            optStr: null,
            optBool: null,
            nested: null,
        };
    }
}