struct NestedOpt {
    a: Int?;
}

struct NestedInContract {
    inner: NestedOpt;
}

contract OptInStructInContract {
    data: NestedInContract;

    init() {
        self.data = NestedInContract{
            inner: NestedOpt{ a: null }
        };
    }
}