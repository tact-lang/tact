struct ParamStruct {
    foo: Int;
}

contract ParamInitContract(
    param: ParamStruct,
    optionalParam: ParamStruct?
) {
    receive() {
        // do nothing, presence allows compilation
    }
}