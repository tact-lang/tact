struct OptionalChain1 {
    v: Int?;
}
struct OptionalChain2 {
    p: OptionalChain1?;
}
struct OptionalChain3 {
    q: OptionalChain2?;
}

contract OptionalChains {
    data: OptionalChain3;

    init() {
        self.data = OptionalChain3{ q: null };
    }
}