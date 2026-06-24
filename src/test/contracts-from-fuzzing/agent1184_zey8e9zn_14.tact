struct NestedStringOpt {
    opt1: String?;
    opt2: String?;
}

contract NestedStringOptional {
    field: NestedStringOpt;

    init() {
        self.field = NestedStringOpt{
            opt1: null,
            opt2: null
        };
    }
}