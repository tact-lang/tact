struct InnerStruct {
    flag: Bool;
    number: Int;
}

struct OuterStruct {
    innerOpt: InnerStruct?;
    label: String;
}

contract OptionalNestedStructField {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            innerOpt: null,
            label: "Testing"
        };
    }
}
