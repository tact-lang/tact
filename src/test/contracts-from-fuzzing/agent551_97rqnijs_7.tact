struct InnerStruct {
    foo: Int;
}

struct OuterStruct {
    maybeInner: InnerStruct?;
    bar: String;
}

contract TestContract {
    composite: OuterStruct;
    
    init() {
        self.composite = OuterStruct{
            maybeInner: null,
            bar: "test",
        };
    }
}