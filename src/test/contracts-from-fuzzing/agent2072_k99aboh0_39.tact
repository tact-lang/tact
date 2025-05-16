struct DeepNested {
    alpha: Int?;
    beta: String?;
    gamma: Bool?;
}

struct ContainerOpt {
    inside: DeepNested?;
    count: Int;
}

contract ParamsMixed(
    param1: ContainerOpt,
    param2: Bool?,
    param3: Int,
) {}