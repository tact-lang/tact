struct SDeep {
    v1: Int;
    v2: String;
}

contract DefaultStructNoInit {
    s: SDeep = SDeep { v1: 8, v2: "hello" };
}