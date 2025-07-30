struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: InnerStruct?;
}

struct InnerStruct {
    d: String?;
    e: Bool?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: true,
            c: InnerStruct{
                d: "hi",
                e: null,
            }
        };
    }
}