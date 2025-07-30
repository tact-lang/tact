struct Inner {
    x: Int as int64;
    y: Int as int64;
    label: String;
}

struct Outer {
    p1: Inner;
    p2: Inner?; // optional nested struct
    desc: String?; // optional string
}

contract ParamTest(
    count: Int as uint32,
    flag: Bool,
    info: Outer,
    note: String?,
) {
    receive() {}
}