struct InnerOpt {
    optionalNum: Int?;
    optionalBool: Bool?;
}

contract TestContract {
    innerOpt: InnerOpt;

    init() {
        self.innerOpt = InnerOpt{
            optionalNum: null,
            optionalBool: true,
        };
    }
}
