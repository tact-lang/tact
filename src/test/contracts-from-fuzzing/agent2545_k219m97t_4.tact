struct NestOptInner {
    val: Int?;
}

struct NestOptOuter {
    field: NestOptInner?;
}

contract NestedOptionalStructField {
    s: NestOptOuter;

    init() {
        self.s = NestOptOuter{
            field: null
        };
    }
}
