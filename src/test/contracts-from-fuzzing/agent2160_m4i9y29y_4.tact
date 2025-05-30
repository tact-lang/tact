struct DeepOptional {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            optInt: null,
            optBool: true,
            optStr: null,
            optAddr: null
        };
    }
}