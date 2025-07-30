struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    v: NestedOptionalStruct;

    init() {
        self.v = NestedOptionalStruct{
            a: null,
            b: true,
            c: "hello",
            d: InnerStruct{
                x: 5,
                y: false,
            }
        };
    }
}