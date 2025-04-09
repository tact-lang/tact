message(0x8888) Status {
    ok: Bool;
    code: Int?;
}

contract ParamOfOptionalMsg(
    status: Status?,
) {}