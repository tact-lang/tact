struct OptionalNested {
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ nestedOpt: null };
    }
}