struct InnerStruct {
    a: Int;
}

struct OuterStruct {
    x: Int;
    inner: InnerStruct;
}

contract TestContract {
    data: OuterStruct?;

    init() {
        self.data = null;
    }
}