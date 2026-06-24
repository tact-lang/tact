struct DeeperOptional {
    inner: InnerOptional?;
}

struct InnerOptional {
    foo: Int?;
    s: String;
}

contract NestedNulls {
    d: DeeperOptional;

    init() {
        self.d = DeeperOptional{
            inner: null
        };
    }
}
