struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
}

contract TestContract {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            a: null,
            b: true,
            c: "test",
            d: InnerStruct{
                x: 1,
                y: false,
            },
        };
    }
}