contract Test {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            innerOpt: InnerStruct{
                a: 1,
                b: 2
            }
        };
    }
}

struct OptionalNested {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Int;
}