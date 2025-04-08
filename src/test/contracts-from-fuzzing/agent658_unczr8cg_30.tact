contract NestedOptionalStructField {
    optNested: MaybeS? = null;

    init() {
        self.optNested = null;
    }
}

struct MaybeS {
    n: Int;
}
