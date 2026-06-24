struct NestedOpt {
    inner: Int?;
    flag: Bool?;
}

contract TestOpt {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{
            inner: null,
            flag: true,
        };
    }
}