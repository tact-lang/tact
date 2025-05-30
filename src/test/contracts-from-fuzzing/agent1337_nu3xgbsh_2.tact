struct InnerStruct {
    value: Int;
}

struct OuterStruct {
    nested: InnerStruct?;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{ nested: null };
    }
}