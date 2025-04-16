struct OptionalDeep {
    nestedOpt: Int?;
    plain: Int;
}

contract OptInStruct {
    field: OptionalDeep;

    init() {
        self.field = OptionalDeep{
            nestedOpt: null,
            plain: 42
        };
    }
}
