struct Deep {
    a: Int;
    b: String;
    c: Bool;
}

contract NoInitDefaults {
    d: Deep = Deep{a: 1, b: "hi", c: false};
}