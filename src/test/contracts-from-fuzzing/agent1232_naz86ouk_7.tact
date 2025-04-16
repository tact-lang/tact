struct OptionalLayer {
    innerOpt: Int?;
    boolOpt: Bool?;
}

struct NestedOptionalWrapper {
    opt1: OptionalLayer?;
    opt2: OptionalLayer?;
}

contract OptNestedStructField {
    field: NestedOptionalWrapper;

    init() {
        self.field = NestedOptionalWrapper{
            opt1: null,
            opt2: OptionalLayer{innerOpt: 123, boolOpt:true}
        };
    }
}
