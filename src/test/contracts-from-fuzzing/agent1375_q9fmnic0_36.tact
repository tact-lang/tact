struct ParamStruct {
    foo: Int = 77;
    flag: Bool = true;
}

contract ParamOptContract(
    inner: ParamStruct?
) {}