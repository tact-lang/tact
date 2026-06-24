struct NestedOpt {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ inner: null };
    }
}