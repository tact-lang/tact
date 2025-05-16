struct BigDefaults {
    x1: Int = 1;
    x2: Int = 2;
    x3: Int = 3;
    x4: Int = 4;
    x5: Int = 5;
    x6: Int = 6;
    x7: Int = 7;
    x8: Int = 8;
    x9: Int = 9;
    x10: Int = 10;
}

contract ManyDefaults {
    s: BigDefaults = BigDefaults{};
}