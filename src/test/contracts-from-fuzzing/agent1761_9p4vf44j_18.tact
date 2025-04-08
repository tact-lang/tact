struct NestedDefaultOpt {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int? = null;
    b: Bool? = null;
}

contract TestContract {
    data: NestedDefaultOpt;

    init() {
        self.data = NestedDefaultOpt{
            inner: InnerStruct{}
        };
    }
}