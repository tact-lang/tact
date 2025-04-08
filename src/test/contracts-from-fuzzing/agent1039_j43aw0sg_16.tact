struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: String;
}

contract TestContract {
    nestOpt: NestedOptionalStruct;

    init() {
        self.nestOpt = NestedOptionalStruct{
            inner: null
        };
    }
}