struct NestedOpt {
    field1: Int?;
    field2: Bool?;
}

struct WrapperOpt {
    inner: NestedOpt?;
}

contract TestContract {
    data: WrapperOpt;
    init() {
        self.data = WrapperOpt{ inner: NestedOpt{ field1: 99, field2: true } };
    }
}