message(555) Mmsg { foo: Int; }

struct Holder { m: Mmsg?; }

contract ParamsOptMsgParam(
    h: Holder
) {}