struct OptionalS {
    inner: Int?;
}

struct Wrapper {
    nested: OptionalS;
}

contract NestedOptionalStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper {
            nested: OptionalS { inner: null }
        };
    }
}
