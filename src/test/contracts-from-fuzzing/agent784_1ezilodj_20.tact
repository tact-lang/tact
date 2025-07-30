struct ParamsStruct {
    foo: Int = 1;
    bar: Bool = true;
}

contract OptParamNestedStruct(
    data: ParamsStruct?,
) {}
