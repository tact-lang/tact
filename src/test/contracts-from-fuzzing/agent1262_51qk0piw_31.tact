struct DeepOpt {
    x: Int?;
    y: Bool?;
}

struct WrapOpt {
    d: DeepOpt?;
}

contract OptionalOptional {
    val: WrapOpt = WrapOpt{ d: null };
}