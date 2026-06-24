struct InnerDef {
    z: Int = 8;
}

contract ParamWithOptionalNested(
    n: InnerDef?,
) {}