struct OptionalDeep {
    inner: Int?;
    nestedOpt: String?;
    enabled: Bool?;
}

struct UsingOpt {
    useIt: OptionalDeep;
    flag: Bool;
}

contract OptionalNested {
    val: UsingOpt = UsingOpt{
        useIt: OptionalDeep{
            inner: null,
            nestedOpt: null,
            enabled: null
        },
        flag: false
    };
}
