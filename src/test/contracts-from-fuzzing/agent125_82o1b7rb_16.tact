struct NestedMixed {
    a: Int;
    b: Bool?;
    c: InnerStruct;
}

struct InnerStruct {
    d: Int?;
    e: String;
}

contract TestContract {
    data: NestedMixed;
    init() {
        self.data = NestedMixed{
            a: 5,
            b: null,
            c: InnerStruct{ d: null, e: "test" }
        };
    }
}