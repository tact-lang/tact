message(10) M {
    foo: Int;
}

struct Wrap {
    m: M?;
}

contract ParamOptMsg(
    w: Wrap?,
) {}
