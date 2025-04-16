struct NestedStruct {
    s1: Int;
    s2: Int;
    s3: Int;
}

contract ParamVsInit(
    val: NestedStruct,
) {
    // According to documentation, contracts **cannot** use init() with parameters if parameter syntax is in use.
}
