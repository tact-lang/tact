struct InnerOpt {
    x: Bool?;
    y: String?;
}

struct OuterOpt {
    foo: Int?;
    bar: InnerOpt?;
}

contract NestedOptionalStructs {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}