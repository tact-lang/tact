struct NestedOptionalStruct {
    foo: InnerStruct?;
}

struct InnerStruct {
    bar: Int?;
}

contract ComplicatedOptionalContract {
    state: NestedOptionalStruct;

    init() {
        self.state = NestedOptionalStruct{
            foo: InnerStruct{ bar: null }
        };
    }
}