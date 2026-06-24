struct DefaultsAndOpts {
    x: Int = 7;
    y: String = "hello";
    z: Bool = false;
    optX: Int?;
    optY: String?;
}

contract ContractDefaults {
    data: DefaultsAndOpts;
    init() {
        self.data = DefaultsAndOpts{
            optX: null,
            optY: null
        };
    }
}
