struct SOptOpt {
    foo: Int?;
    bar: Bool?;
}

contract ContractOptOpt {
    innerOpt: SOptOpt?;

    init() {
        self.innerOpt = null;
    }
}