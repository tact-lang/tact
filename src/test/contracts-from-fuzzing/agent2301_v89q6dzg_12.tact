struct DoubleNestedOption {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract DoubleOpt {
    data: DoubleNestedOption;
    init() {
        self.data = DoubleNestedOption{
            inner: InnerOpt{ val: null }
        };
    }
}