contract NegDefaults {
    a: Int = -1;
    b: Int as int8 = -5;
    c: Int as int16 = -15;
    d: Int as int32 = -31;

    init() {}
}