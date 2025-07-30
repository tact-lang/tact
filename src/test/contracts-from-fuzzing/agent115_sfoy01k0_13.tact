struct ParamStruct {
    p1: Int;
    p2: Bool;
    p3: String;
}

contract ParamVsInit(param: ParamStruct) {
    // no init(), pure parameter assignment
}
