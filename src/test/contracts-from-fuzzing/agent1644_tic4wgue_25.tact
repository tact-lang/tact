struct DeepOpt {
    val: Int?;
}

struct OuterOpt {
    d: DeepOpt?;
}

contract TestContract {
    f: OuterOpt? = null;

    init() {}
}