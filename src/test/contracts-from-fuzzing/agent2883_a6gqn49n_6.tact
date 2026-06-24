struct OptComposite {
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optAddr: Address?;
}

contract OptionalComposite {
    data: OptComposite;

    init() {
        self.data = OptComposite{
            optInt: null,
            optStr: null,
            optBool: null,
            optAddr: null
        };
    }
}