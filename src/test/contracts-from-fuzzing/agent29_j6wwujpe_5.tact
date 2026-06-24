struct NestedWithOptional {
    innerOpt: Int?;
    nested: InnerStruct?;
}

struct InnerStruct {
    foo: Bool;
    bar: String?;
}

contract NestedOptContract {
    data: NestedWithOptional;

    init() {
        self.data = NestedWithOptional{
            innerOpt: null,
            nested: InnerStruct{
                foo: true,
                bar: null
            }
        };
    }
}