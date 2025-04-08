struct InnerOpt {
    ival: Int?;
    bval: Bool?;
}

contract TestOpt {
    optField: InnerOpt = InnerOpt{
        ival: null,
        bval: null
    };

    init() {
        self.optField = InnerOpt{
            ival: 42,
            bval: true
        };
    }
}
