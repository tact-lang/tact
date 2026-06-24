struct AA {
    a: Int;
    b: Int?;
}

contract ManyDefaults {
    p1: AA = AA{ a: 10, b: 20 };
    p2: AA = AA{ a: 5, b: null };

    init() {}
}