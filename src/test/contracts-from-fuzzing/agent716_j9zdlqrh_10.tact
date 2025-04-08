struct InnerOpt {
    foo: Int?;
    bar: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalInOptional {
    outerField: OuterOpt?;

    init() {
        self.outerField = null;
    }
}