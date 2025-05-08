struct NestedOpt {
    inner: Int?;
}

contract OptInNested {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{inner: null};
    }
}