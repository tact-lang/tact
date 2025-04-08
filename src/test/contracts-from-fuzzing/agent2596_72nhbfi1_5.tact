struct InnerOpt {
    v: Int?;
}

contract DeepOpt {
    nested: InnerOpt? = null;

    init() {}
}