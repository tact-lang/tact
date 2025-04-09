struct SeveralOptions {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Address?;
    five: Bool = true;
}

contract ContractOpts {
    opts: SeveralOptions = SeveralOptions{};
    init() {}
}