struct MixedOpt {
    optA: Address?;
    optB: Address?;
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    data: MixedOpt;

    init() {
        self.data = MixedOpt{
            optA: null,
            optB: null,
            optInt: null,
            optBool: null
        };
    }
}