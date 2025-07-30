struct InitStruct {
    foo: Int = 27;
    bar: Bool = false;
}

contract ParamNestedStruct(
    data: InitStruct,
) {}
