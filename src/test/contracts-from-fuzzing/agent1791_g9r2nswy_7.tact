struct DeepOpt {
    s: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    a: Int?;
    b: Bool;
}

contract Test8 {
    val: DeepOpt = DeepOpt{
        s: null,
        inner: null
    };
    init() {}
}
