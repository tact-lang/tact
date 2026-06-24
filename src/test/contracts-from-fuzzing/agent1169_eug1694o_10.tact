struct InnerMost {
    val: Int;
}

struct MidOptional {
    inner: InnerMost?;
    name: String?;
}

struct OuterOptional {
    data: MidOptional?;
}

contract NestedOptionalsComplex {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{data: null};
    }
}