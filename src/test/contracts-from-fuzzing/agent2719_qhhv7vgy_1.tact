struct OptionalNested {
    s: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{ s: InnerStruct{ a:1, b:false } };
    }
}