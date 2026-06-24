struct Alpha {
    a: Int;
    b: Bool;
    c: String;
}

struct Beta {
    d: Int;
    e: Bool?;
    f: String?;
}

struct Gamma {
    g: Int;
    h: Bool;
    i: String;
}

contract CombinedHeavy(
    one: Alpha,
    two: Beta?,
    three: Gamma,
    num: Int,
    flag: Bool,
    note: String?,
    toggle: Bool?,
) {
}