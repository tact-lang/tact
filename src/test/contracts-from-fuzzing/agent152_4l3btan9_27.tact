struct DeepOptional {
    innerInt: Int?;
    innerFlag: Bool?;
}

contract TestContract {
    nestedOpt: DeepOptional?;

    init() {
        self.nestedOpt = DeepOptional{
            innerInt: null,
            innerFlag: true
        };
    }
}
