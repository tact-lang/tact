struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterStruct {
    s1: InnerStruct;
    s2: InnerStruct;
}

contract NestedStructContract {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            s1: InnerStruct{ a: 1, b: true, c: "X" },
            s2: InnerStruct{ a: 2, b: false, c: "Y" }
        };
    }
}