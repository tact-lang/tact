struct ComplexOptional {
    innerOpt: InnerStruct?;
    flag: Bool;
}

struct InnerStruct {
    a: Int?;
    b: Bool;
}

contract Test {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            innerOpt: null,
            flag: true,
        };
    }
}