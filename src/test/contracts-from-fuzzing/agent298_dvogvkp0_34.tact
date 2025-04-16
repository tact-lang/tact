struct I {
    val: Int;
}

contract OnlyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "h";
    d: I = I{ val: 3 };
    init() {}
}