struct InnerOpt {
    z: Int?;
}

contract NoExplicitNullDefault {
    val: InnerOpt = InnerOpt{};
}