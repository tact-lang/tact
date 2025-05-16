struct S2 {
    x: Int;
    y: String?;
}

struct S1 {
    data: S2;
    counter: Int;
    enabled: Bool;
}

contract ParamStruct(
    s: S1
) {

    receive() {}
}