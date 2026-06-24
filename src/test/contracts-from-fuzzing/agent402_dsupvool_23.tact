struct ParamStruct {
    x: Int = 1;
    y: Bool?;
}

contract TestContract(
    p: ParamStruct,
    q: Int?,
) {}