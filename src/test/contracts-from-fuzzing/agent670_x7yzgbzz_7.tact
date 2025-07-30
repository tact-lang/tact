struct OptDeep {
    nestedOpt: Int?;
    deepOpt: Bool?;
}

contract NullDefaults {
    param: OptDeep;

    init() {
        self.param = OptDeep{
            nestedOpt: null,
            deepOpt: null,
        };
    }
}