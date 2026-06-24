struct StrOpt {
    s: String?;
}

struct NestedSOpt {
    inner: StrOpt;
}

contract StringNest {
    data: NestedSOpt;

    init() {
        self.data = NestedSOpt{
            inner: StrOpt{
                s: null
            }
        };
    }
}