struct NestedOptional {
    optNested: InnerStruct?;
}

struct InnerStruct {
    x: Int = 10;
    y: Bool = true;
}

contract OptionalNestedContract {
    data: NestedOptional = NestedOptional{};

    init() {
        self.data = NestedOptional{
            optNested: InnerStruct{
                x: 99,
                y: false
            }
        };
    }
}