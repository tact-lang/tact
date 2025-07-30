struct Deep {
    a: Int;
    b: Bool?;
    c: String;
}

contract DeepDefaults {
    d: Deep = Deep{ a: 5, b: null, c: "x" };
}