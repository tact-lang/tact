struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract BothMixed(
    p1: Mixed,
    p2: Mixed?,
    x: Int?,
    y: Bool?,
    z: String?
) {}
