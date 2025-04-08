struct OuterOptional {
    nestedOpt: InnerOptional?;
    count: Int;
}

struct InnerOptional {
    x: Int;
    y: String?;
}

contract OptionalNest {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nestedOpt: null,
            count: 77,
        };
    }
}