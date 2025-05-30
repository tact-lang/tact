struct ParamStruct {
    x: Int = 42;
    y: Bool;
}

contract TestContract(
    arg: ParamStruct,
) {
    receive() {}
}