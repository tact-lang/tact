struct ParamsStruct {
    field1: Int;
    field2: Bool?;
    label: String = "default";
}

contract ParamStyleContract(
    param: ParamsStruct,
) {
    receive() {}
}