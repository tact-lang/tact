struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ParamsWithOptionals(
    d: DeepOptionals?,
    e: Int?,
    f: Bool?,
) {}
