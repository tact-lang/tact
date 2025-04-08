struct SDeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct ContainerOpt {
    s: SDeepOpt?;
}

contract DeepOptionalsContainer {
    val: ContainerOpt?;
}