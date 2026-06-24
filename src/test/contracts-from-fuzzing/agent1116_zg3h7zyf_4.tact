struct DeepOpt {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optString: String?;
}

contract TestContract {
    nested: DeepOpt;

    init() {
        self.nested = DeepOpt{
            optInt: 42,
            optBool: true,
            optAddr: null,
            optCell: null,
            optString: "Hi"
        };
    }
}