struct One {
    num: Int;
}

struct Two {
    txt: String;
}

struct Three {
    flag: Bool;
}

contract AllOptionals(
    x: One?,
    y: Two?,
    z: Three?,
    note: String?,
    count: Int?,
    enable: Bool?,
) {
}