// test contract parameter whose type is optional struct
struct ParamStruct {
    f1: Int;
    f2: Bool;
}

contract OptParamContract(
    param: ParamStruct?,
) {
    receive() {
        // nothing
    }
}