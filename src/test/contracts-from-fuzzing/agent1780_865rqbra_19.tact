struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract OptionalParam(
    nestedOpt: DeepOptionals?
) {}