struct NestedOptionComplex {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int?;
}

contract TestContract {
    data: NestedOptionComplex;

    init() {
        self.data = NestedOptionComplex{
            inner: null
        };
    }
}
