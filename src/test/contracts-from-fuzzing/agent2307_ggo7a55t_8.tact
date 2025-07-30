struct ContainsOptionalStruct {
    s: InnerOpt?;
}

struct InnerOpt {
    f: Bool;
    n: Int?;
}

contract OptionalStructField {
    field: ContainsOptionalStruct;

    init() {
        self.field = ContainsOptionalStruct{
            s: null
        };
    }
}
