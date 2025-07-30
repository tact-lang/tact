struct OptionalNest {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    number: Int;
}

contract OptNestedContract {
    data: OptionalNest;
    init() {
        self.data = OptionalNest{ innerOpt: null };
    }
}