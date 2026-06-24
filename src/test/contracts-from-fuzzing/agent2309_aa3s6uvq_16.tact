// test optional struct inside contract param
struct ParamStruct {
    field1: Int;
    field2: Bool;
}

contract ParamOpt(
    p: ParamStruct?
) {}