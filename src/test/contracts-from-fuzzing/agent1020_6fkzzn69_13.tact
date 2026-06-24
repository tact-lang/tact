struct OptionalDeep {
    chain: Chain1?;
}

struct Chain1 {
    val: Int;
    next: Chain2?;
}

struct Chain2 {
    name: String;
    flag: Bool?;
}

contract DeepOpt {
    field: OptionalDeep;

    init() {
        self.field = OptionalDeep{
            chain: Chain1{
                val: 1,
                next: Chain2{
                    name: "X",
                    flag: null
                }
            }
        };
    }
}