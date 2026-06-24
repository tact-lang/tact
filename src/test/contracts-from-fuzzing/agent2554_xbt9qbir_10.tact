struct DeepOpt {
    f1: Int?;
    f2: String?;
    f3: Cell?;
    f4: Address?;
    f5: Bool?;
}

contract DeepParamOpt(
    val: Int?,
    nested: DeepOpt
) {
    // implicit defaults to null / empty per parameters semantics
}