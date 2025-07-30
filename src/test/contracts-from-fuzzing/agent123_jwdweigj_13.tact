struct NestedStringOpt {
    inner: String?;
}

contract StringOptNest {
    data: NestedStringOpt;

    init() {
        self.data = NestedStringOpt{
            inner: null
        };
    }
}