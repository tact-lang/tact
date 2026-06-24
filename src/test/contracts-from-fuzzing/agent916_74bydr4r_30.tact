message(111) InfoMsg {
    info: String;
}

struct Wrapper {
    msg: InfoMsg;
    flag: Bool;
}

contract Test(
    data: Wrapper,
) {}