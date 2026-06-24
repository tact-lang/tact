struct InnerOpt {
    flag: Bool?;
    amount: Int = 0;
}

struct OuterOpt {
    inner: InnerOpt?;
    count: Int?;
}

contract OptionalStructs {
    store: OuterOpt = OuterOpt{};
    receive() {}
}