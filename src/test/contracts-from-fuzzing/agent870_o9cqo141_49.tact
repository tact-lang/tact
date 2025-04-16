struct DeepOptionalDefault {
    foo: Int?;
    bar: String?;
}

contract DefaultInits {
    v: DeepOptionalDefault = DeepOptionalDefault{};
}