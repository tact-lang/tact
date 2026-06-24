struct NestedOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: InnerOpt{ val: 42 }
        };
    }
}