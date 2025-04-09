struct NestedOptional {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    innerValue: Int?;
}

contract TestContract {
    nestedOpt: NestedOptional;

    init() {
        self.nestedOpt = NestedOptional{
            maybeInner: InnerStruct{
                innerValue: null
            }
        };
    }
}