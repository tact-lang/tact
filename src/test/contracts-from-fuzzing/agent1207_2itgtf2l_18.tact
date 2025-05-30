struct NestedStringOpt {
    s: String?;
}

struct Container {
    inner: NestedStringOpt;
    inner2: NestedStringOpt?;
}

contract StringsOptionalContract {
    data: Container;

    init() {
        self.data = Container{
            inner: NestedStringOpt{ s: null },
            inner2: null
        };
    }
}