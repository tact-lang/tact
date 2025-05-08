struct OptChain3 {
    note: String?;
    value: Int?;
}

struct OptChain2 {
    deep: OptChain3?;
    flag: Bool?;
}

struct OptChain1 {
    chain: OptChain2?;
    data: String?;
}

contract OptionNesting {
    persist: OptChain1;

    init() {
        self.persist = OptChain1{
            chain: OptChain2{
                deep: OptChain3{
                    note: null,
                    value: null
                },
                flag: true
            },
            data: null
        };
    }
}