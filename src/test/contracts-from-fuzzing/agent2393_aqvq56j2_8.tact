struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: String?;
    f: Bool?;
}

contract SEmbed {
    s: S = S { a: 1, b: false, c: 2, d: "X", e: "Y", f: null };
}