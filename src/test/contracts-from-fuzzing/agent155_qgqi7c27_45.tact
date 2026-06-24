contract SerializeDefaults {
    a: Int as uint8 = 1;
    b: Int as int16 = -2;
    c: Int as coins = ton("1");
    init() {}
}