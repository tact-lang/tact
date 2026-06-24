struct DeepOpt {
    inner: Int?;
    name: String;
}

struct OuterOpt {
    nested: DeepOpt?;
    flag: Bool;
}

contract NestedOptContract {
    val: OuterOpt = OuterOpt{
        nested: DeepOpt{
            inner: null,
            name: "nested",
        },
        flag: true
    };
}