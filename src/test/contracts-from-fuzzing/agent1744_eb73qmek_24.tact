// test contract parameters with optional message struct param
message(0xDEAD) ParamMsg {
    f: Int;
}

contract ParamHasOptMsg(
    pm: ParamMsg?
) {}
