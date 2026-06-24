struct OneOptNested {
    inner: InnerOpt?;
}

struct InnerOpt {
    level: Int;
    desc: String;
}

struct AnotherNested {
    holder: OneOptNested;
    count: Int;
    flag: Bool;
}

contract ComplexOptionalChain {
    chain: AnotherNested;

    init() {
        self.chain = AnotherNested{
            holder: OneOptNested{
                inner: null
            },
            count: 77,
            flag: false,
        };
    }
}