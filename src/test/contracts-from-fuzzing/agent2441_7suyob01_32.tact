// Struct nested inside optional, optional nested inside struct
struct InnerOptStruct {
    foo: Int;
    bar: Bool;
}

struct OuterOptStruct {
    nested: InnerOptStruct?;
    another: Int;
}

contract NestedOptInverse {
    data: OuterOptStruct;
    init() {
        self.data = OuterOptStruct{
            nested: null,
            another: 42,
        };
    }
}