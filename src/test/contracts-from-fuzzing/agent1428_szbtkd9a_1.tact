struct NestedOptional {
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
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: true,
            c: "hello",
            d: InnerStruct{ x: 12, y: false }
        };
    }
}